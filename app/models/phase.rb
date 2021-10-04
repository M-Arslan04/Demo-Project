class Phase < ApplicationRecord
  belongs_to :lead
  has_many :comments, as: :commentable
  has_many :phase_assignments, dependent: :destroy
  has_many :users, through: :phase_assignments
  validates :phase_type, :start_date, :due_date, presence: true
end
