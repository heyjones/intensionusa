class RemoveNamespaceFromMetafields < ActiveRecord::Migration
  def change
  	remove_column :metafields, :namespace
  end
end