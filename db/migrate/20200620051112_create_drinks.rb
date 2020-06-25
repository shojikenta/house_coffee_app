class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
      t.float :portion
      t.text :tips
      t.text :reference
      t.integer :required_time
      t.text :made_memo
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :drinks, [:user_id, :created_at]
  end
end
