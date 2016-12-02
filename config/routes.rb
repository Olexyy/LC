Rails.application.routes.draw do

  resources :text_styles
  resources :lawsuits
  resources :web_resources
  get '', to: 'home#index'
  resources :categories
  resources :subcategories
  get ':controller(/:action(/:id))'

end
