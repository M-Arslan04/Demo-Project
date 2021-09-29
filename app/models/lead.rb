class Lead < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :client_name, :client_address, :client_email, :client_contact, :platform_used, :test_type,
            presence: true
end
