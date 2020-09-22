class Admins::OrderItemsController < ApplicationController
  def index
  	@orders = Order.all
  	@order_items = OrderItem.page(params[:page]).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
    @order_items = OrderItem.all
    @order_item = OrderItem.new
  	@order_status = Order.new
  	@make_status = Order.new
  end

  def update
    @order = Order.find(params[:id])
  	@order.update(order_params)
  	redirect_to admins_order_item_path(@order)
  end

  protected
  def order_params
    params.require(:order).permit(:order_status)
  end
end
