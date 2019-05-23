class PagesController < ApplicationController
  before_action  :authenticate_user!, only:[:home]
    def home
      @users= User.all
      @orders=Order.all
    end
  end