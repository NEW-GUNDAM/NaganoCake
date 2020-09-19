class ProductsController < ApplicationController
  def index
  end

  def show
  	@genres = Genre.all
  	@product = Product.find(params[:id])

  end

  def about
  end

  def top
  	@genres = Genre.all
  	@recommendation = Product.all.limit(4)
  end
end
