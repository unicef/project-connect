class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :address
      t.string :admin0
      t.string :admin1
      t.string :admin2
      t.string :admin3
      t.string :admin4
      t.string :admin_code
      t.string :admin_id
      t.string :altitude
      t.float :availability_connectivity
      t.boolean :connectivity
      t.string :country_code
      t.string :datasource
      t.text :description
      t.string :educ_level
      t.boolean :electricity
      t.string :environment
      t.string :frequency
      t.float :latency_connectivity
      t.float :lat
      t.float :lon
      t.string :name
      t.integer :num_classrooms
      t.integer :num_latrines
      t.integer :num_teachers
      t.integer :num_students
      t.integer :num_sections
      t.string :phone_number
      t.string :postal_code
      t.float :speed_connectivity
      t.string :type_connectivity
      t.string :type_school
      t.boolean :water

      t.timestamps
    end
  end
end
