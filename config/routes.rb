Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'photographers#index'

get 'photographers/:photographer_id/photographers/viewall' => 'reservations#viewall', as: :viewall



resources :users do
  resources :photographers
end
resources :sessions,    only: [:new, :create, :destroy]

resources :photographers do
  resources :reservations
end


end
