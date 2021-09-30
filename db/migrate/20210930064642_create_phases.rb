class CreatePhases < ActiveRecord::Migration[6.1]
  def change
    create_table :phases do |t|
      t.string :type
      t.date :start_date
      t.date :due_date
      t.references :lead, null: false, foreign_key: true

      t.timestamps
    end
  end
end
