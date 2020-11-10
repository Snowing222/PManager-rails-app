class AddFactoryIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :factory_id, :integer
  end
end
