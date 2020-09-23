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
    @order_items = @order.order_items
    @order.update(order_params)

      if @order.order_status == "入金待ち"
        @order_items.update(make_status: "着手不可")
      elsif @order.order_status == "入金確認"
        @order_items.update(make_status: "製作待ち")
      end

  	redirect_to admins_order_item_path(@order)
  end

  protected
  def order_params
    params.require(:order).permit(:order_status, :customer_id, :addressee, :zipcode ,:send_to_address ,:freight ,:total_price ,:how_to_pay)
  end
end
