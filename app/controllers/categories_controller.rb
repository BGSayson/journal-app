class CategoriesController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @categories = Category.all
  # end

  # def show
  # end

  # def new
  # end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      redirect_to dashboard_path
    else
      p "Huh"
    end
  end

  def edit
    @category = Category.find(params[:id])
    render :edit
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to dashboard_path
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to dashboard_path
    else
      p @category.errors.messages
    end
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
