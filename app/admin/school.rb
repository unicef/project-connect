ActiveAdmin.setup do |config|
  config.default_per_page = 100
end
ActiveAdmin.register School do
  active_admin_import validate: true,
  before_batch_import: proc { |import|
    # country_lookup = JSON.parse(File.read('./public/country_codes.json'))
    # Get country code from file name
    country_code = import.file.original_filename.split('-').first.upcase
    import.headers["country_code"] = :country_code
    import.headers["datasource"] = :datasource
    import.batch_replace(:country_code, { nil =>  country_code} )
    import.batch_replace(:datasource, { nil =>  import.file.original_filename} )
  },
  after_batch_import: proc{ |import|
     #the same
  }


  actions :all
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :name, :country_code, :lat, :lon
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  # index do
  #   selectable_column
  #   id_column
  #   column :country_code
  #   column :name
  #   column :lat
  #   column :lon
  #   # column :category
  #   # column "Release Date", :released_at
  #   # column :price, :sortable => :price do |product|
  #   #   div :class => "price" do
  #   #     number_to_currency product.price
  #   #   end
  #   # end
  #
  # end
  form do |f|
    f.inputs do
      f.input :address
      f.input :admin0
      f.input :admin1
      f.input :admin2
      f.input :admin3
      f.input :admin4
      f.input :name
      f.input :country_code, as: :country, label: "Country"
      # f.input :country, :as => :string
      f.input :lat
      f.input :lon
      f.input :admin_id
      f.input :altitude
      f.input :availability_connectivity
      f.input :connectivity
      f.input :country_code
      f.input :datasource
      f.input :description
      f.input :educ_level
      f.input :electricity
      f.input :environment
      f.input :frequency
      f.input :latency_connectivity
      f.input :lat
      f.input :lon
      f.input :name
      f.input :num_classrooms
      f.input :num_latrines
      f.input :num_teachers
      f.input :num_students
      f.input :num_sections
      f.input :phone_number
      f.input :postal_code
      f.input :speed_connectivity
      f.input :type_conectivity
      f.input :type_school
      f.input :water
    end
    f.actions
  end
end
