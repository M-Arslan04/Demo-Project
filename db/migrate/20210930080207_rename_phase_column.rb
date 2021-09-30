class RenamePhaseColumn < ActiveRecord::Migration[6.1]
  def up
    rename_column :phases, :type, :phase_type
  end

  def down
    rename_column :phases, :phase_type, :type
  end
end
