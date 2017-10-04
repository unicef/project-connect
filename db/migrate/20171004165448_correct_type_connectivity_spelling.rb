class CorrectTypeConnectivitySpelling < ActiveRecord::Migration[5.1]
  def change
    rename_column :schools, :type_conectivity, :type_connectivity
  end
end
