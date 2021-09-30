# class Leads::CommentsController < CommentsController
#   before_action :set_commentable

#   private

#   def set_commentable
#     @commentable = Lead.find(params[:lead_id])
#   end
# end
class Leads::CommentsController < ApplicationController
  def create
    @lead = Lead.find(params[:lead_id])
    @comment = @lead.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    byebug
    redirect_to lead_path, notice: 'Your comment has been saved!'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
