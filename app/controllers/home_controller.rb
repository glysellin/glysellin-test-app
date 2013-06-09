class HomeController < ApplicationController
  def index
    @fruits = Fruit.published
  end
end
