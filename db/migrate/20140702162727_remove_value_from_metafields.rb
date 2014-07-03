class RemoveValueFromMetafields < ActiveRecord::Migration
  def change
  	remove_column :metafields, :value
  end
end
