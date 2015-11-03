Rails.application.routes.draw do
  root 'characters#new'

  #Characters Routes
  get 'characters' => 'characters#index', as: :characters
  post 'characters' => 'characters#create'
  get 'characters/new' => 'characters#new', as: :new_character
  get 'characters/:character_id/edit' => 'characters#edit' , as: :edit_character
  get 'characters/:character_id' => 'characters#show', as: :character
  patch 'characters/:character_id' => 'characters#update'
  delete 'characters/:character_id' => 'characters#destroy'

  #Stories Routes
  get 'stories' => 'stories#index', as: :stories
  post 'stories' => 'stories#create'
  get 'stories/new' => 'stories#new', as: :new_story
  get 'stories/:story_id/edit' => 'stories#edit', as: :edit_story
  get 'stories/:story_id' => 'stories#show', as: :story
  patch 'stories/:story_id' => 'stories#update', as: :update_story
  delete 'stories/:story_id' => 'stories#destroy'

  #Front-End Playable Routes
  get 'characters/:character_id/:story_id' => 'stories#show', as: :play_story
  get 'characters/:character_id/:story_id/:branch_id' => 'stories#play_branch', as: :play_branch

  #Qualities Routes
  resources :qualities
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
