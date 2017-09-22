class AddCreatorEmail < ActiveRecord::Migration[5.1]
  change_table :schools do |t|
    t.string :creator_email
  end
end
