class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(params.require(:comment).permit(:text))
    @post = Post.find(params[:id])
    @comment.post_id = @post.id

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Comment could not be ccreated!!'
      render :new
    end
  end
end
