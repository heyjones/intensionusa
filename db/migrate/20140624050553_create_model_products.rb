class CreateModelProducts < ActiveRecord::Migration
  def change
    create_table :model_products do |t|
      t.integer :model_id
      t.integer :product_id

      t.timestamps
    end
  end
end
