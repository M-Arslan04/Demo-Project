class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :leads
  has_many :phase_assignments, dependent: :destroy
  has_many :phases, through: :phase_assignments
  after_create :assign_default_role
  def assign_default_role
    add_role(:engineer) if roles.blank?
  end
end
