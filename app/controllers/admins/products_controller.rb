class Admins::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.page(params[:page]).includes(:genre)
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product =Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product =Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_products_path
    else
      render :edit
    end
  end

  protected

  def product_params
    params.require(:product).permit(:name, :introduction, :image, :price, :status, :genre_id, :genre_name)
  end
end
