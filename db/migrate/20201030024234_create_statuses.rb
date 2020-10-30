class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :current_state
      t.integer :owner_id
      t.date :deadline
      t.integer :sample_id

      t.timestamps
    end
  end
end
