Rails.application.routes.draw do
  root 'characters#new'

  get 'intro' => 'characters#intro', as: :intro

  resources :characters
  resources :stories

  # Front-End Playable Routes
  get 'characters/:character_id/:story_id' => 'stories#show', as: :play_story
  get 'characters/:character_id/:story_id/:branch_id' => 'stories#play_branch', as: :play_branch

  # Qualities Routes
  resources :qualities
end
