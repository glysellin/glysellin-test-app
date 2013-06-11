# This migration comes from glysellin_associated_products_engine (originally 20130607163155)
class CreateGlysellinProductAssociations < ActiveRecord::Migration
  def up
    create_table :glysellin_product_associations do |t|
      t.integer :position
      t.integer :associated_product_id
      t.integer :referer_product_id
      t.timestamps
    end
  end

  def down
    drop_table :glysellin_product_associations
  end
end
