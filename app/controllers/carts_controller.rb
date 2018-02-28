class CartsController < ApplicationController
  def show
  end

  def create
    session[:qty] = params[:qty].to_i
    redirect_to cart_path
  end

  private

  def product_qty
    session[:qty]
  end
  helper_method :product_qty

end
