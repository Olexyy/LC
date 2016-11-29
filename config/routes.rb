Rails.application.routes.draw do
   get '', to: 'home#index'
   resources :categories
   resources :subcategories
   get ':controller(/:action(/:id))'
end
