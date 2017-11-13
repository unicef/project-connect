class AddRealTimeFields < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.string :probe_id
      t.string :probe_provider
      t.string :isp_id
      t.string :school_id
    end
    add_index :schools, :probe_id
    add_index :schools, :probe_provider
    add_index :schools, :isp_id
    add_index :schools, :school_id
  end
end
