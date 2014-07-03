class RemoveValueTypeFromMetafields < ActiveRecord::Migration
  def change
  	remove_column :metafields, :value_type
  end
end
