# class CommentsController < ApplicationController
#   def create
#     @comment = @commentable.comments.new(comment_params)
#     @comment.user = current_user
#     @comment.save
#     byebug
#     redirect_to @commentable, notice: 'Your comment has been saved!'
#   end

#   private

#   def comment_params
#     params.require(:comment).permit(:content)
#   end
# end
