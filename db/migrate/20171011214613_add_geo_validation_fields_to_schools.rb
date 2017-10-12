class AddGeoValidationFieldsToSchools < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.boolean :coords_within_country
      t.timestamp :date_geo_validated
    end
    add_index :schools, :coords_within_country
    add_index :schools, :date_geo_validated
  end
end
