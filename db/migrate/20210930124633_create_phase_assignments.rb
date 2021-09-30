class CreatePhaseAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :phase_assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
