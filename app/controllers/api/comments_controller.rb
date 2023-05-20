class Api::CommentsController < ApplicationController
  
    def index
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
      render json: @post.comments
    end
end