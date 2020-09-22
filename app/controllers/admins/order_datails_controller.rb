class Admins::OrderDatailsController < ApplicationController
  def update
  	@order_item = OrderItem.find(params[:id])
  	@order_item.update(order_item_params)
  	redirect_to admins_order_item_path(@order_item)
  end

  protected
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end
end
