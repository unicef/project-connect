class AddGeoValidationFieldsToSchools < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.boolean :coords_within_country
      t.datetime :date_geo_validated
    end
  end
end
