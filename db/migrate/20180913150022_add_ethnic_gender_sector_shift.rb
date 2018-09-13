class AddEthnicGenderSectorShift < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.string :ethnic_group
      t.string :gender
      t.string :sector
      t.string :shift_type
    end
    add_index :schools, :ethnic_group
    add_index :schools, :gender
    add_index :schools, :sector
    add_index :schools, :shift_type
  end
end
