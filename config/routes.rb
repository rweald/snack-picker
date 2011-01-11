SnackPicker::Application.routes.draw do
  resources :snacks, :only => [:index, :update, :create]
  
  root :to => "snacks#index" 
end
