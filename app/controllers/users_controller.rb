class UsersController < JSONAPI::ResourceController
  include AuthenticateHelper
  include Orderable
  respond_to :json
  before_action :authenticate_request!, except: [:create]

  has_scope :by_post_count, only: :index

  def search_users
    if request.get?
      user = User.text_search(params[:query])
    end
    respond_with user
  end

  def search_user_posts_by_email
    posts_array = []
    if request.get?
      p = User.text_search(params[:email]).posts
        posts_array << p
    end
    respond_with posts_array
  end

  def index
    @users = apply_scopes(User).
      order(ordering_params(params)).
      includes(:post)
      all

    render json: @users
  end

end
