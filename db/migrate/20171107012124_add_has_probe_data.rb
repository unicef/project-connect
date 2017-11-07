class AddHasProbeData < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.boolean :hasProbeData
    end
    add_index :schools, :hasProbeData
  end
end
