class ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.where(status: "true" )
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
      params.require(:product).permit(:genre_id, :name, :introduction, :image_id, :price, :status)
    end
end
