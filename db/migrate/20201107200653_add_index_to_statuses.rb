class AddIndexToStatuses < ActiveRecord::Migration[6.0]
  def change
    add_index :statuses, :current_state
    add_index :statuses, :sample_id
  end
end
