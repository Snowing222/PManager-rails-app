class AddIndexToProducts < ActiveRecord::Migration[6.0]
  def change
    add_index :products, :production_partner_id
    add_index :products, :design_partner_id
    add_index :products, :manufacture_partner_id
    add_index :products, :product_status
end
