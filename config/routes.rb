SnackPicker::Application.routes.draw do
  resources :snacks, :only => [:index, :new, :create]
end
