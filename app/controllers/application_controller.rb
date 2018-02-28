class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def total_amount
    # in cents
    session[:qty] * 100
  end
  helper_method :total_amount

  def product_qty
    session[:qty]
  end
  helper_method :product_qty

end
