class PhasesController < ApplicationController
  def index
    @phases = Phase.all
  end
end
