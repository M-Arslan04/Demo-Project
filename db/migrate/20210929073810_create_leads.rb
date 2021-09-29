class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :title
      t.string :client_name
      t.text :client_adderss
      t.string :client_email
      t.string :client_contact
      t.string :platform_used
      t.string :test_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
