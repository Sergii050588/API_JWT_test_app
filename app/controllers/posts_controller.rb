class PostsController < JSONAPI::ResourceController
  include AuthenticateHelper
  include Orderable
  respond_to :json
  before_action :authenticate_request!

  has_scope :by_created_at, using: [:from, :to], only: :index

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
      order(ordering_params(params)).
      all

    render json: @posts
  end

 
end
