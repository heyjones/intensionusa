class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end
end
