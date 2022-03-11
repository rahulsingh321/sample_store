Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :products, only: %i[index update] do
        get :check_price, on: :collection
      end
    end
  end
end
