class Phase < ApplicationRecord
  belongs_to :lead
  has_many :comments, as: :commentable

  validates :phase_type, :start_date, :due_date, presence: true
end
