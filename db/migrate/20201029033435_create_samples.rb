class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.text :comment
      t.integer :sample_type
      t.integer :product_id
      t.integer :status_id

      t.timestamps
    end
  end
end
