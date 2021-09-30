class PhasesController < ApplicationController
  before_action :set_lead, only: %w[index show new create]
  def index
    @phases = @lead.phases.all
  end

  def show
    @phase = Phase.find(params[:id])
  end

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

  private

  def set_lead
    @lead = Lead.find(params[:lead_id].to_i)
  end

  def phase_params
    params.require(:phase).permit(:phase_type, :start_date, :due_date)
  end
end
