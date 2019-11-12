Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  #Users
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  resources :stocks, :holdings, :suggestions, :users

  #Teams
  resources :teams do
    get 'join', on: :member
  end

  #Voting - https://www.cryptextechnologies.com/blogs/voting-functionality-in-ruby-on-rails-app
  resources :suggestions do
    member do
        put "like" => "suggestions#upvote"
        put "unlike" => "suggestions#downvote"
    end
  end

  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'static_pages#signup'
  get '/login', to: 'static_pages#login'
  get "*path", to: redirect('/')

end
