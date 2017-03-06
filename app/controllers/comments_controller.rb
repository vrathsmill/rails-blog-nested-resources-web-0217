class CommentsController < ApplicationController

  def create
        @comment = Comment.new(comment_params)

        @post = Post.find(params[:post_id])
        @post.comments << @comment
        @comment.save 
        redirect_to @post
      else
        render :new
      end
    end

private


  def comment_params
    params.require(:comment).permit(:content, :user_id,:post_id)
    end
  end
