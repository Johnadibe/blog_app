class Api::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    render json: @post.comments
  end
  def create
    user = User.find(comment_params[:user_id])
    post = Post.find(comment_params[:post_id])
    new_comment =
      Comment.new(user: user, post: post, text: comment_params[:text])
    if new_comment.save
      render json: 'Comment saved successfully', status: 200
    else
      render json: 'error saving comment', status: 400
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end
end
