class Admins::OrderDatailsController < ApplicationController
  def update
  	@order_item = OrderItem.find(params[:id])
  	@order = @order_item.order
  	@order_item.update(order_item_params)
	if
	  @order_item.make_status == "製作中"
	  @order.update(order_status: "製作中")
	elsif
	  @order.order_items.count == @order.order_items.where(make_status: "製作完了").count
	  @order.update(order_status: "発送準備中")
	end
  	redirect_to admins_order_item_path(@order_item)
  end

  protected
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end
end
