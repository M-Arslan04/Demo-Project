class RenameAddressColumnInLead < ActiveRecord::Migration[6.1]
  def up
    rename_column :leads, :client_adderss, :client_address
  end

  def down
    rename_column :leads, :client_address, :client_adderss
  end
end
