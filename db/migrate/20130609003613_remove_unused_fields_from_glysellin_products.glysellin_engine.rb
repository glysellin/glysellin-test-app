# This migration comes from glysellin_engine (originally 20130609023300)
class RemoveUnusedFieldsFromGlysellinProducts < ActiveRecord::Migration
  def up
    change_table :glysellin_products do |t|
      t.remove :name
      t.remove :description
      t.remove :position
      t.remove :slug
      t.remove :sku
      t.remove :published
    end
  end

  def down
    change_table :glysellin_products do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.string :slug
      t.string :sku
      t.boolean :published, default: true
    end
  end
end
