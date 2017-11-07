class AddHasProbeData < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.boolean :has_probe_data
    end
    add_index :schools, :has_probe_data
  end
end
