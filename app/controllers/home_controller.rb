class HomeController < ApplicationController
  def index
    @products = Glysellin::Product.all
  end
end
