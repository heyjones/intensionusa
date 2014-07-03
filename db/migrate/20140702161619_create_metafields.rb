class CreateMetafields < ActiveRecord::Migration
  def change
    create_table :metafields do |t|
      t.string :product_type
      t.string :description
      t.string :key
      t.string :namespace
      t.string :value
      t.string :value_type

      t.timestamps
    end
  end
end
