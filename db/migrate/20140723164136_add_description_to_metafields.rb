class AddDescriptionToMetafields < ActiveRecord::Migration
  def change
  	add_column :metafields, :description, :string
  end
end