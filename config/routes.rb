Rails.application.routes.draw do

  resources :block_subgroups
  resources :block_field_block_parts
  resources :block_parts
  resources :blocks
  resources :block_groups
  resources :block_fields
  resources :lawsuits
  resources :web_resources
  resources :categories
  resources :subcategories
  #resources :lawsuit_blocks
  get 'lawsuit_blocks/:id', to: 'lawsuit_blocks#index'
  get '', to: 'home#index'
  get :penetrate, to: 'admin#index'
  get :lawsuits_list, to: 'home#lawsuits_list'
  get :page, to: 'home#page'
  # devise requirement
  root to: 'home#index'
  # alter devise registration controller
  devise_for :users , controllers: { registrations: 'users/registrations' }
  post 'lawsuit_blocks/action', to: 'lawsuit_blocks#action'
  post 'lawsuit_blocks/selected', to: 'lawsuit_blocks#selected'
  get 'lawsuit_blocks/:id/edit', to: 'lawsuit_blocks#edit'
  post 'lawsuit_blocks/block_parts_sort', to: 'lawsuit_blocks#block_parts_sort'
  post 'lawsuit_blocks/block_parts_load', to: 'lawsuit_blocks#block_parts_load'
  #get ':controller(/:action(/:id))'
end
