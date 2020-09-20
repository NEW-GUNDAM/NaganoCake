class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :update, :destroy, :edit]
  before_action :set_customer

  def index
    @cart_items = @customer.cart_items.all

  end

  def create
    @cart_item = @customer.cart_items.new(cart_item_params)
    @current_item = CartItem.find_by(product_id: @cart_item.product_id, customer_id: @cart_item.customer_id)
    @cart_item.save
    flash[:notice] = 'カートに商品が追加されました。'
    redirect_to cart_items_path
  end

  def update
    if @cart_item.update(cart_item_params)
      flash[:notice] = 'カート内の商品を更新しました。'
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

   private
  def set_customer
    @customer = current_customer
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
      params.require(:cart_item).permit(:quantity, :customer_id, :product_id)
  end
end
