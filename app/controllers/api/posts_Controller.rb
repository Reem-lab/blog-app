class Api::PostsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts, status: :ok
  end

  # GET /posts/{username}
  def show
    @post = Post.find(params[:id])
    render json: @post, status: :ok
  end

end