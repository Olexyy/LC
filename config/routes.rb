Rails.application.routes.draw do

  resources :lawsuit_blocks
  resources :block_parts
  resources :blocks
  resources :block_groups
  resources :block_fields
  resources :text_styles
  resources :lawsuits
  resources :web_resources
  resources :categories
  resources :subcategories
  get '', to: 'home#index'
  get :penetrate, to: 'admin#index'
  get :lawsuits_list, to: 'home#lawsuits_list'
  # devise requirement
  root to: 'home#index'
  # alter devise registration controller
  devise_for :users , controllers: { registrations: 'users/registrations' }
  # get ':controller(/:action(/:id))'
end
