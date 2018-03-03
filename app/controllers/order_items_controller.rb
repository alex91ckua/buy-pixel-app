class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
    @order_item ||= @order.order_items.new(order_item_params)
    @order_item.assign_attributes(order_item_params)
    @order_item.save
    if @order_item.valid?
      @order.save
      session[:order_id] = @order.id
      redirect_to_cart
    else
      redirect_to cart_path, :flash => { :danger => @order_item.errors.full_messages.to_sentence }
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item
      @order_item.assign_attributes(order_item_params)
      @order_item.save
      if @order_item.valid?
        @order.save
        session[:order_id] = @order.id
        @order_items = @order.order_items
        redirect_to_cart
      else
        redirect_to cart_path, :flash => { :danger => @order_item.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order.save # trigger re-calculation
    @order_items = @order.order_items
    redirect_to_cart
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def redirect_to_cart
    redirect_to cart_path
  end
end
