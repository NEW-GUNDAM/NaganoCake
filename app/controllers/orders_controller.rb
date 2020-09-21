class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    @total_item_price = @order_item.sum{|c| c.order_price * c.quantity }
  end

  def new
    @order = current_customer.orders.new
    @addresses = Address.where(customer_id: current_customer)
  end

  def thanks
  end

  def create
    session[:order] = Order.new

    session[:send_to_address] = Address.new

    session[:order][:how_to_pay] = params[:order][:how_to_pay].to_i

    if params[:order][:selected_address] == "my address"
      session[:order][:zipcode] = current_customer.zipcode
      session[:order][:send_to_address] = current_customer.address
      session[:order][:addressee] = current_customer.last_name + current_customer.first_name
    elsif params[:order][:selected_address] == "address"
      addresses = Address.find(params[:order][:shipping])
      session[:order][:zipcode] = addresses.zipcode
      session[:order][:send_to_address] = addresses.address
      session[:order][:addressee] = addresses.name
    elsif params[:order][:selected_address] == "new address"
      session[:order][:zipcode] = params[:order][:zipcode]
      session[:order][:send_to_address] = params[:order][:send_to_address]
      session[:order][:addressee] = params[:order][:addressee]

      session[:address][:zipcode] = params[:order][:zipcode]
      session[:address][:send_to_address] = params[:order][:send_to_address]
      session[:address][:addressee] = params[:order][:addressee]

      session[:selected_address] = "new address"
    end

    session[:order][:order_status] = 0
    cart_items = current_customer.cart_items
    sum = 0
    cart_items.each do |cart_item|
      sum += (cart_item.product.price * cart_item.quantity * 1.1).round
        end
          session[:order][:total_price] = sum + 800
          session[:order][:freight] = 800
          session[:order][:customer_id] = current_customer.id

    redirect_to orders_comfirm_path

  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(id: "DESC")
  end

  def comfirm
    @cart_items = current_customer.cart_items
    @total_item_price = @cart_items.sum{|c| c.product.price * c.quantity }
    @Tax = 1.1
    @Fee = 800
  end

  private
  def orders
    params.require(:order).permit(:customer_id, :freight, :total_price, :how_to_pay, :zipcode, :send_to_address, :addressee, :order_status)
  end

end
