class ProductsController < ApplicationController
   def index
    @genres = Genre.where(genre_status: "true" )
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @products = @genre.products.where(status: "true").all
    else
      @products = Product.where(status: "true" )
    end
  end

  def show
    @genres = Genre.where(genre_status: "true" )
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
       @products = @genre.products.where(status: "true" ).all.includes(:genre)
    else
      @products = Product.where(status: "true" )
    end
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def about
  end

  def top
    @genres = Genre.where(genre_status: "true" )
    @recommendation = Product.where(status: "true" ).all.limit(4)
  end

  private
    def product_params
      params.require(:product).permit(:genre_id, :name, :introduction, :image, :price, :status)
    end
end
