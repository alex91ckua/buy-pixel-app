class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def total_amount
    # in cents
    session[:qty] * 100
  end
  helper_method :total_amount

  def total_amount_cents
    # in cents
    session[:qty] * 100
  end
  helper_method :total_amount_cents

  def product_qty
    session[:qty]
  end
  helper_method :product_qty


  def transaction_id
    session[:transaction_id]
  end
  helper_method :transaction_id

end
