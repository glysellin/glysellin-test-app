# This migration comes from restful_sync (originally 20130502120757)
class CreateRestfulSyncSyncRefs < ActiveRecord::Migration
  def change
    create_table :restful_sync_sync_refs do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :uuid

      t.timestamps
    end
  end
end
