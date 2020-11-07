class AddIndexToSamples < ActiveRecord::Migration[6.0]
  def change
    add_index :samples, :product_id
    add_index :samples, :sample_type
  end
end
