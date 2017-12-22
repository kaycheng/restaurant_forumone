class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all
    @category = Category.new

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Great!"
        redirect_to admin_categories_path
      else
        @categories = Category.all
        flash.now[:alert] = "Oops! We have some errors here!"
        render :index
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  

end
