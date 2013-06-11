class CreateVegetables < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
