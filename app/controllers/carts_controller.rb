class CartsController < ApplicationController
  before_action :validate_qty, only: [:create]

  def show
  end

  def create
    reset_session
    session[:qty] = params[:qty].to_i
    redirect_to cart_path
  end

  private

  def validate_qty
    qty = params[:qty].to_i
    if qty <= 0
       flash[:danger] = 'QTY should be positive number'
       redirect_to root_path
    end
  end

end
