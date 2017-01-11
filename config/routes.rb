Rails.application.routes.draw do

  resources :block_subgroups
  resources :block_parts
  resources :blocks
  resources :block_groups
  resources :block_fields
  resources :lawsuits
  resources :web_resources
  resources :categories
  resources :subcategories
  resources :block_field_block_parts
  #resources :lawsuit_blocks
  # alter devise registration controller
  devise_for :users , controllers: { registrations: 'users/registrations' }
  # devise requirement
  get '', to: 'home#index'
  root to: 'home#index'
  get :penetrate, to: 'admin#index'
  get :lawsuits_list, to: 'home#lawsuits_list'
  get :page, to: 'home#page'
  # custom paths for lawsuit blocks 'ajax', 'block' and 'lawsuit'
  get 'lawsuit_blocks/lawsuit/:id', to: 'lawsuit_blocks#lawsuit'
  post 'lawsuit_blocks/action', to: 'lawsuit_blocks#action'
  post 'lawsuit_blocks/selected', to: 'lawsuit_blocks#selected'
  get 'lawsuit_blocks/block/:id', to: 'lawsuit_blocks#block'
  post 'lawsuit_blocks/ajax', to: 'lawsuit_blocks#ajax'
  get 'lawsuit_blocks/fields/:id', to: 'lawsuit_blocks#fields'
  # custom paths for block parts 'ajax', 'new', 'edit' and 'delete'
  get 'block_part/new/:id', to: 'block_parts#new_alter'
  post 'block_part/edit/:id', to: 'block_parts#create_alter'
  get 'block_part/edit/:id', to: 'block_parts#edit_alter'
  patch 'block_part/edit/:id', to: 'block_parts#update_alter'
  delete 'block_part/delete/:id', to: 'block_parts#destroy_alter'
  post 'block_part/ajax', to: 'block_parts#ajax'
  #get ':controller(/:action(/:id))'
end
