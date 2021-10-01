class PhasesController < ApplicationController
  before_action :set_lead
  before_action :set_phase, only: %w[show edit update]
  before_action :set_manager, only: %w[show edit]

  def index
    @phases = @lead.phases.all
  end

  def show; end

  def new
    @phase = Phase.new
  end

  def create
    @phase = @lead.phases.new(phase_params)

    if @phase.save!
      redirect_to lead_path(@lead)
    else
      render :new
    end
  end

  def edit
    @managers = {}
    @engineers = {}
    User.all.collect do |user|
      @managers[user.name] = user.id if user.roles.first.name == 'manager'
    end

    User.all.collect do |user|
      @engineers[user.name] = user.id if user.roles.first.name == 'engineer'
    end
  end

  def update
    byebug
    if params[:user_ids].length > 0
      @extra = params[:user_ids]
      @extra.each do |usid|
        @user = User.find(usid)
        @assignment = PhaseAssignment.new(user_id: @user.id, phase_id: @phase.id)
        @assignment.save
      end

    else
      @user = User.find(phase_params[:user_ids].to_i)
      @assignment = PhaseAssignment.new(user_id: @user.id, phase_id: @phase.id)
      UserMailer.example(@user).deliver
    end
    redirect_to lead_phase_path(@lead.id, @phase.id)
    # if @assignment.save
    # else
    #   render :edit
    # end
    # if @phase.update(book_params)
    #   redirect_to book_path
    # else
    #   render :new
    # end
  end

  private

  def set_manager
    @assigned_user = PhaseAssignment.where(phase_id: @phase.id)
    @assigned_manager = User.find(@assigned_user.first.user_id) unless @assigned_user.empty?
  end

  def set_lead
    @lead = Lead.find(params[:lead_id].to_i)
  end

  def set_phase
    @phase = Phase.find(params[:id])
  end

  def phase_params
    params.require(:phase).permit(:phase_type, :start_date, :due_date, :user_ids, :engineer_idass)
  end
end
