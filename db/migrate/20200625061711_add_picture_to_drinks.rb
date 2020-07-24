class AddPictureToDrinks < ActiveRecord::Migration[5.2]
  def change
    add_column :drinks, :picture, :string
  end
end
