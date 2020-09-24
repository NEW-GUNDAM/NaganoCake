class Admins::OrderDatailsController < ApplicationController
  def update
  	@order_item = OrderItem.find(params[:id])
  	@order = @order_item.order
  	@order_item.update(order_item_params)
  	redirect_to admins_order_item_path(@order)
  end

  protected
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end
end
