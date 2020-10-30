class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :season
      t.string :style_number
      t.string :image_url
      t.text :description
      t.integer :product_status
      t.date :deadline
      t.integer :production_partner_id
      t.integer :design_partner_id
      t.integer :manufacture_partner_id

      t.timestamps
    end
  end
end
