class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :drink_id
      t.string :remarks

      t.timestamps
    end
    add_index :items, :drink_id 
  end
end
