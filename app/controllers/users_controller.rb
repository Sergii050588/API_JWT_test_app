class UsersController < JSONAPI::ResourceController
  include AuthenticateHelper
  respond_to :json
  before_action :authenticate_request!, except: [:create]

  def index
    @users = User.
      all.select { |t| t.posts.count > params[:post_counter].to_i }

    render json: @users
  end

  def search_users
    users_array = []
    if request.get?
      user = User.text_search(params[:query]).each do |user|
        users_array << user
      end
    end
    respond_with users_array
  end

  def search_user_posts_by_username
    posts_array = []
    if request.get?
      posts = User.find_by_name(params[:name]).posts
        posts_array << posts
    end
    respond_with posts_array
  end

end
