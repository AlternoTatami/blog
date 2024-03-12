Rails.application.routes.draw do

  get "/welcome", to: "welcome#index"

  get 'welcome/index' #le dice a Rails que asigne las solicitudes a al acción de índice del controlador de bienvenida
  #get 'articles/index' 

  root 'welcome#index' #le dice a Rails que mapee las solicitudes a la raíz del aplicación a la acción de índice del controlador de bienvenida 

  resources :articles do
    resources :comments
  end
  
  #define todas los acciones RESTful estándar


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
