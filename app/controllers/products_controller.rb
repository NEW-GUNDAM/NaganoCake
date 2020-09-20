class ProductsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  def about
  end

  def top
  	@genres = Genre.all
  	@recommendation = Product.all.limit(4)
  end

  private
    def product_params
      params.require(:product).permit(:genre_id,:name, :introduction,:image, :price, :status)
    end
end
