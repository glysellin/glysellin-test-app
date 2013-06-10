GlysellinTest::Application.routes.draw do

  mount RestfulSync::Engine => '/api', :as => 'api' 

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: "home#index"

  resource :user, only: [:show, :edit, :update]

  glysellin_at '/shop'
end
