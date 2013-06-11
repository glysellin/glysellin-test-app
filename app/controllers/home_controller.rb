class HomeController < ApplicationController
  def index
    @fruits = Fruit.published
    @vegetables = Vegetable.published
  end
end
