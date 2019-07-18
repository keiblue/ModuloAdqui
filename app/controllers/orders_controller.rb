class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf { render  template: 'orders/detalle', pdf: 'Detalle', layout: 'pdf.html'} 
    end

  end

  # GET /orders/new
  def new

    @order_new = true 
    @order = Order.new
    @users = User.all
    @providers= Provider.all
    @status = Status.all

    @items = @providers.first.items
    @payments = Payment.all
  end

  # GET /orders/1/edit
  def edit
    @users = User.all

    @provider= Order.find(params[:id]).provider
    @providers= Provider.all
    if session[:admin]
    @status = Status.all
    else
    @status = Status.find(2,3,5)
    end
    @items = @provider.items

    @payments = Payment.all
  
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.items= params[:items]

    #@order.items_counts = params[:counts]

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      @order.items= params[:items]

      #@order.items_counts = params[:counts]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :estimated_delivery_date, :delivery_date, :user_id, :provider_id,:status_id,:items,:counts, :payment_id)
    end
end
