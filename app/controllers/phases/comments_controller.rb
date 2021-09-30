# class Phases::CommentsController < CommentsController
#   before_action :set_commentable

#   private

#   def set_commentable
#     @commentable = Phase.find(params[:phase_id])
#   end
# end

class Phases::CommentsController < ApplicationController
  def create
    @phase = Phase.find(params[:phase_id])
    @lead = Lead.find(params[:lead_id])
    @comment = @phase.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to lead_phase_path(@lead.id, @phase.id), notice: 'Your comment has been saved!'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
