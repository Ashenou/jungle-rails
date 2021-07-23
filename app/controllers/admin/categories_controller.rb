class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    #raise category.inspect
    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new
    end
  end

  def categories_params
    params.require(:category).permit(
      :name,
    )
  end
end
