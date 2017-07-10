Rails.application.routes.draw do
  post 'auth_user' => 'authentication#authenticate_user'
  
  jsonapi_resources :posts
  jsonapi_resources :users

  # Search for User model
  get '/users/search/:query' => 'users#search_users'
  get '/users/name/:name' => 'users#search_user_posts_by_name'

  #Search for Post model
  get '/posts/search/:query' => 'posts#search_posts'

end
