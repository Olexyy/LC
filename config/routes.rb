Rails.application.routes.draw do

  resources :lawsuit_blocks
  resources :block_parts
  resources :blocks
  resources :block_groups
  resources :block_fields
  resources :text_styles
  resources :lawsuits
  resources :web_resources
  get '', to: 'home#index'
  resources :categories
  resources :subcategories
  get ':controller(/:action(/:id))'

end
