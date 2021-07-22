class Admin::DashboardController < ApplicationController

  #Display a count of how many products are in the database
  #Display a count of how many categories are in the database

  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  #protected
  def show
    @productsCount = Product.all.size
    @categoriesCount = Category.all.size

  end
end
