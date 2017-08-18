Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :counties, only: [:index]
    resources :countries do
      resources :states do
        resources :counties do
        end
      end
    end
  end
end
