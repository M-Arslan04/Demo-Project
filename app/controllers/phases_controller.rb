class PhasesController < ApplicationController
  before_action :set_lead
  before_action :set_phase, only: %w[show edit update]
  before_action :set_manager, only: %w[show edit]
  before_action :set_engineers_ist, only: %w[show edit]

  def index
    @phases = @lead.phases.all
  end

  def show; end

  def new
    @phase = Phase.new
    authorize @phase
  end

  def create
    @phase = @lead.phases.new(phase_params)
    authorize @phase

    if @phase.save!
      redirect_to lead_path(@lead)
    else
      render :new
    end
  end

  def edit
    authorize @phase
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
    authorize @phase
    # byebug
    # if params[:user_ids].length > 0
    if params[:user_ids].instance_of?(Array)
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

  def set_engineers_ist
    @assigned_engineer = PhaseAssignment.where(phase_id: @phase.id)
    @assigned_engineer_arr = []
    @assigned_engineer.each do |engnr|
      @assigned_engineer_arr << User.find(engnr.user_id) unless @assigned_engineer.empty?
    end
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
