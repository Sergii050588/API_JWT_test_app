class PostsController < JSONAPI::ResourceController
  include AuthenticateHelper
  respond_to :json
  before_action :authenticate_request!

  has_scope :created, using: [:from, :to, :order], only: :index do |controller, scope, value|
    scope.created_from(value[0]).created_to(value[1]).created_order(value[2])
  end

  api :GET, "/posts/search/:query", "Search Posts by :query (name, body, created_at)"
  param :name, String, :desc => "Name of the post", :required => true
  param :body, String, :desc => "Body of the post", :required => true
  error :code => 401, :desc => "Unauthorized"
  def search_posts
    posts_array = []
    if request.get?
      Post.text_search(params[:query]).each do |post|
        posts_array << post
      end
    end
    respond_with posts_array
  end

  def index
    @posts = apply_scopes(Post).
      all

    render json: @posts
  end

end
