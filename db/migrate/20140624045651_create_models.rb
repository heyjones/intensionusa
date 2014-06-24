class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :make_id
      t.integer :material_id
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
