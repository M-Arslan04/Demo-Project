class Lead < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :phases

  validates :title, :client_name, :client_address, :client_email, :client_contact, :platform_used, :test_type, :user_id,
            presence: true
end
