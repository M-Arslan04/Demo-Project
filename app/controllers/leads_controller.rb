class LeadsController < ApplicationController
  before_action :set_lead, only: ['show']

  def index
    @leads = Lead.all
  end

  def show; end

  def new
    @lead = Lead.new
    authorize @lead
  end

  def create
    @lead = current_user.leads.new(lead_params)
    # byebug
    authorize @lead

    if @lead.save!
      redirect_to leads_path
    else
      render :new
    end
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:title, :client_name, :client_address, :client_email, :client_contact, :platform_used,
                                 :test_type)
  end
end
