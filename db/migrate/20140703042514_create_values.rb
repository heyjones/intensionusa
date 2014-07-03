class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :metafield_id
      t.string :name

      t.timestamps
    end
  end
end
