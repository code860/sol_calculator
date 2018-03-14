Rails.application.routes.draw do
  scope path: 'api' do
    resources :installations
    resources :points
    resources :properties, only: [:index] #this is the route we will use when querying the properties
  end
  mount_ember_app :frontend, to: "/"
end
