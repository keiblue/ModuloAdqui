class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_provider, only: [:index, :edit, :update, :new, :show]

  # GET /items
  # GET /items.json
  def index
    if @provider_param
      @items = Provider.find(params[:provider_id]).items
    else
      @items = Item.all
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    if !@provider_param
      @providers = Provider.all
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path(:provider_id => item_params[:provider_id]), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      if @provider_param
        format.html { redirect_to items_path(:provider_id => item_params[:provider_id]), notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to items_path, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:id, :nombre, :precio, :provider_id)
    end

    def set_provider
      if params[:provider_id].present?
        @items = Provider.find(params[:provider_id]).items
        @provider = Provider.find(params[:provider_id])
        @provider_param = true
      else
        @provider_param = false
      end
    end
end
