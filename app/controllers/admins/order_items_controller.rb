class Admins::OrderItemsController < ApplicationController
  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page]).reverse_order
    else
      @orders = Order.page(params[:page]).reverse_order
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price = @order_items.sum{|order_item|order_item.order_price * order_item.quantity }
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
