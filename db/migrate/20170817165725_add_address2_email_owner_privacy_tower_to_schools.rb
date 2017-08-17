class AddAddress2EmailOwnerPrivacyTowerToSchools < ActiveRecord::Migration[5.1]
  def change
    change_table :schools do |t|
      t.string :address2
      t.string :person_contact
      t.string :email
      t.float :geoloc_confidence
      t.float :tower_dist
      t.string :tower_type_service
      t.string :tower_type
      t.string :tower_code
      t.float :tower_latitude
      t.float :tower_longitude
      t.string :owner
      t.string :provider
      t.boolean :is_private
      t.boolean :provider_is_private
    end
  end
end
