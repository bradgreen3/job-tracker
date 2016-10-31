class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(user_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.delete

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(user_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to categories_path
    else
      :edit
    end
  end

  private

  def user_params
    params.require(:category).permit(:title)
  end
end
