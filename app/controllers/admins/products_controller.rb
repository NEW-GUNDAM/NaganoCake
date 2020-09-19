class Admins::ProductsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @products = product.all
  end

  def create
  end

  def edit
    @product = product.find(params[:id])
  end

  def update
  end
end
