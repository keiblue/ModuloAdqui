class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

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
    @roles = Role.all
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    # User.create( email: "esclavo@email.com", password: "password", password_confirmation: "password", rutito:"23456789", name:"Dead", last_name:"Slave", role_id:2, rutito_dv:"2" )
    # @user = User.new( email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation], rutito:params[:rut], name:params[:name], last_name:params[:last_name], role_id:params[:role], rutito_dv:params[:rut_dv] )

    puts '-----------------------------------------------------------------'
    puts account_params
    puts '-----------------------------------------------------------------'
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
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:user).permit(:email, :password, :rutito, :name, :last_name, :role, :rutito_dv, :password_confirmation)
    end
end
