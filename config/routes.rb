Rails.application.routes.draw do
  root 'characters#new'

  #Characters Routes
  get 'characters' => 'characters#index', as: :characters
  post 'characters' => 'characters#create'
  get 'characters/new' => 'characters#new', as: :new_character
  get 'characters/:character_id/rename' => 'characters#edit' , as: :edit_character
  get 'characters/:character_id' => 'characters#show', as: :character
  patch 'characters/:character_id' => 'characters#update'
  delete 'characters/:character_id' => 'characters#destroy'

  #Intro
  get 'intro' => 'characters#intro', as: :intro

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
end
