class AddAdminLevelIndexes < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.string :id_0
      t.string :id_1
      t.string :id_2
      t.string :id_3
      t.string :id_4
      t.string :id_5
    end
    add_index :schools, :id_0
    add_index :schools, :id_1
    add_index :schools, :id_2
    add_index :schools, :id_3
    add_index :schools, :id_4
    add_index :schools, :id_5
  end
end
