class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :get_roles, only: [:new, :update, :edit]

  # GET /accounts
  # GET /accounts.json
  def index
    @users = User.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @user = User.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @user = User.new(account_params)

    respond_to do |format|
      if @user.save 
        format.html { redirect_to @user, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        @roles = Role.all
        format.html { render :new }
        format.json { render json: [@user.errors, @roles], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @user.update(account_params)
        format.html { redirect_to @user, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @user = User.find(params[:id])
      @orders = @user.orders
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:user).permit(:email, :password, :rutito, :name, :last_name, :role_id, :rutito_dv, :password_confirmation)
    end

    def get_roles
      @roles = Role.all
    end
end
