class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:show_item, :edit_item, :update_item, :destroy_item]

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  def items
    @items = Provider.find(params[:id]).items
  end

  def new_item
  end

  def create_item
    @item = Item.new(nombre:item_params[:nombre], precio:item_params[:precio], provider_id:params[:id])
    respond_to do |format|
      if @item.save
        format.html { redirect_to provider_items_path, notice: 'Item was successfully created.' }
      format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_item
    @item.destroy
    respond_to do |format|
      format.html { redirect_to provider_items_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @address = Address.all
    @services = Service.all
    @contrato = Agreement.all
  end

  # GET /providers/1/edit
  def edit
    @address = Address.all
    @services = Service.all
    @contrato = Agreement.all
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name,:rut,:rut_dv,:address_id,:service_id,:agreement_id)
    end

    def set_item
      @item = Item.find(params[:id_item])
    end

    def item_params
      params.require(:item).permit(:nombre,:precio)
    end
end
