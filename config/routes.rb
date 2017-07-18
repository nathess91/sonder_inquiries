Rails.application.routes.draw do
  root 'units#index'

  resources :units do
    resources :inquiries
  end
end
