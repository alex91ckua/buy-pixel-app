class HomeController < ApplicationController
  def index
    redirect_to product_path(Product.last) and return
  end
end
