class HomeController < ApplicationController
  def index
    @sellables = Glysellin::Sellable.all
  end
end
