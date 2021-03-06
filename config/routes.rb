require 'api_constraints'

Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get 'courses/search'
    end
  end

    root 'api/v1/ocr#index'
  # constraints :subdomain => 'api' do
    namespace :api, path: nil, defaults: {format: 'json'} do


      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        post 'ocr', to: 'ocr#post', as: 'ocr'
        delete 'ocr', to: 'ocr#destroy', as: 'ocr_delete'
        resources :users, :only => [:create]     
        resources :schedules
        
        # get 'search', to:  'courses#search', as: 'course_search'
        resources :courses do
          collection do
            get 'search'
          end  
        end  
      end

      # scope module: :v3, constraints: ApiConstraints.new(version: 3) do
      #   resources :friendrequests
      #   resources :friendships, :only => [:index, :update]
      #   resources :checkins, :only => [:create]
      #   delete '/checkins', to: 'checkins#destroy', as: 'checkout'
      #   resources :users do
      #     collection do
      #       put 'status'
      #       put 'hide'
      #       delete 'hide', to: 'users#unhide', as: 'unhide'
      #     end
      #   end
      #   get 'version', to: 'venues#version', as: 'version'
      #   # put '/users/status', to: 'users#status', as: 'user_status'
      #   # put '/users/hide', to: 'users#hide', as: 'user_hide'
      #   # delete 'users/hide', to: 'users#unhide', as: 'user_unhide'
      #   resources :venues, :only => [:index, :show] do
      #     collection do
      #       get 'friends'
      #       #get 'specials'
      #     end
      #   end
      #   get "/venue/specials", to: "venues#specials", as: 'venue_specials'
      #   resources :invitations
      #   post '/token', to: 'users#fbtoken', as: 'user_fbtoken'
      # end

    end
  
  # end
end
