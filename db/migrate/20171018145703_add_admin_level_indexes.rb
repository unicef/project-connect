class Add < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.integer :id_0
      t.integer :id_1
      t.integer :id_2
      t.integer :id_3
      t.integer :id_4
      t.integer :id_5
    end
    add_index :schools, :id_0
    add_index :schools, :id_1
    add_index :schools, :id_2
    add_index :schools, :id_3
    add_index :schools, :id_4
    add_index :schools, :id_5
  end
end
