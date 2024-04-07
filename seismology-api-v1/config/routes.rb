Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'application#index'

  get 'api/features', to: 'earthquakes#index'
  get 'api/features/:id', to: 'earthquakes#show'

  post 'api/features/:feature_id/comments', to: 'comments#create'
end
