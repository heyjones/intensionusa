class RemoveDescriptionFromMetafields < ActiveRecord::Migration
  def change
  	remove_column :metafields, :description
  end
end
