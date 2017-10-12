class AddGeoValidationFieldsToSchools < ActiveRecord::Migration[5.1]
  change_table :schools do |t|
    t.string :coords_within_country
    t.datetime :date_geo_validated
  end
end
