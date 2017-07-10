Rails.application.routes.draw do
  post 'auth_user' => 'authentication#authenticate_user'
  
  jsonapi_resources :posts
  jsonapi_resources :users

  # Search for User model
  get '/users/search/:query' => 'users#search_users'
  get '/users/email/:email' => 'users#search_user_posts_by_email'

  #Search for Post model
  get '/posts/search/:query' => 'posts#search_posts'

end
