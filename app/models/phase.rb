class Phase < ApplicationRecord
  belongs_to :lead

  validates :phase_type, :start_date, :due_date, presence: true
end
