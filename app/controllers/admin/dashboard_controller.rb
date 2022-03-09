class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  
  def show
    def index
      @products = Product.all
    end
  end
end
