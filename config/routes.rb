Rails.application.routes.draw do
  root to: "bus_operators#index"
  resources :bus_operators, except: [:new, :create, :destroy] do
    collection do
      get :search
    end
    resources :califications, controller: :bus_operator_califications, only: [:create, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
