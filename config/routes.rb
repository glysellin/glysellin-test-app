GlysellinTest::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: "home#index"

  get 'bootstrap' => 'home#bootstrap', as: 'bootstrap'
  get 'fuelux' => 'home#fuelux', as: 'fuelux'
  get 'glyph' => 'home#glyph', as: 'glyph'

  resource :user, only: [:show, :edit, :update]

  glysellin_at '/shop'
end
