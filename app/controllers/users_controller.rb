class UsersController < JSONAPI::ResourceController
  include AuthenticateHelper
  include Orderable
  respond_to :json
  before_action :authenticate_request!, except: [:create]


  def search_users
    if request.get?
      user = User.text_search(params[:query])
    end
    respond_with user
  end

  def search_user_posts_by_name
    posts_array = []
    if request.get?
      p = User.find_by_name(params[:name]).posts
        posts_array << p
    end
    respond_with posts_array
  end

end
