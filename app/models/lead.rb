class Lead < ApplicationRecord
  belongs_to :user

  validates :title, :client_name, :client_address, :client_email, :client_contact, :platform_used, :test_type,
            presence: true
end
