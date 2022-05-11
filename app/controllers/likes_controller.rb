class LikesController < ApplicationController
  load_and_authorize_resource
  def create
    @like = current_user.likes.new
    @post = Post.find(params[:id])
    @like.post_id = @post.id

    if @like.save
      flash[:success] = 'Like Pressed'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash[:error] = 'Error : like could not be created'
      render :new
    end
  end
end
