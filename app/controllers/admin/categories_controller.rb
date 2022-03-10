class Admin::CategoriesController < ApplicationController
  # http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def index
    @categories = Category.order(id: :desc).all
    @products_in_categories = Product.where(:category_id == Category.ids).count
    #Query: where product :category_id is equal to category id of category, THEN count
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
    
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end  

end