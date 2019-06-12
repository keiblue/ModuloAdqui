class PagesController < ApplicationController
    def home
      @users= User.all
      @orders=Order.all
    end
  end