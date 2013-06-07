GlysellinTest::Application.routes.draw do

<<<<<<< HEAD
  mount RestfulSync::Engine => '/api', :as => 'api' 

=======
>>>>>>> 0338915196eeea810783cbb047a5a238317c9a02
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: "home#index"

  resource :user, only: [:show, :edit, :update]

  glysellin_at '/shop'
end
