require 'pry'
ActiveAdmin.setup do |config|
  config.default_per_page = 100
end

ActiveAdmin.register School do
  before_action only: [:do_import] do
    Thread.current['import.current_admin_user'] = current_admin_user
  end

  active_admin_import  batch_size: 10000000, validate: true,

  before_batch_import: proc { |import|
    # country_lookup = JSON.parse(File.read('./public/country_codes.json'))
    # Get country code from file name
    School.where(datasource: import.file.original_filename).destroy_all
    # Name file will be : 'country_code'-'owner-'privacy_data'-'datasource_id'-'privacy_source'.csv
    file_name_segments = import.file.original_filename.sub(/.csv$/, '').split('-')
    creator_email = Thread.current['import.current_admin_user'].email
    country_code = file_name_segments.first.upcase
    owner = file_name_segments[1]
    is_private = file_name_segments[2].to_i == 1 ? true : false
    provider = file_name_segments[3]
    provider_is_private = file_name_segments[4].to_i == 1 ? true : false

    import.headers["creator_email"] = :creator_email
    import.headers["country_code"] = :country_code
    import.headers["owner"] = :owner
    import.headers["is_private"] = :is_private
    import.headers["provider"] = :provider
    import.headers["provider_is_private"] = :provider_is_private
    import.headers["datasource"] = :datasource

    import.batch_replace(:creator_email, { nil =>  creator_email} )
    import.batch_replace(:country_code, { nil =>  country_code} )
    import.batch_replace(:owner, { nil =>  owner} )
    import.batch_replace(:provider, { nil =>  provider} )
    import.batch_replace(:datasource, { nil =>  import.file.original_filename} )
    import.batch_replace(:is_private, { nil =>  is_private} )
    import.batch_replace(:provider_is_private, { nil =>  provider_is_private} )

  },
  after_batch_import: proc{ |import|
  }

  batch_action :delete do |ids|
    num_schools = ids.count
    ids.each { |id| School.find(id).delete}
    # use those IDs to do stuff here
    redirect_to collection_path, :notice => "We deleted #{num_schools} schools!"
  end
  actions :all
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  #permit_params :name, :country_code, :lat, :lon
  # permit_params :address, :admin0, :admin1, :admin2, :admin3, :admin4, :admin_code, :admin_id, :altitude, :availability_connectivity, :connectivity, :country, :country_code, :datasource, :description, :educ_level, :electricity, :environment, :frequency, :latency_connectivity, :lat, :lon, :name, :num_classrooms, :num_latrines, :num_teachers, :num_students, :num_sections, :phone_number, :postal_code, :speed_connectivity, :type_connectivity, :type_school, :water
  permit_params :address, :admin0, :admin1, :admin2, :admin3, :admin4, :name, :country_code, :lat, :lon, :admin_id, :altitude, :availability_connectivity, :connectivity, :country_code, :datasource, :description, :educ_level, :electricity, :environment, :frequency, :latency_connectivity, :num_classrooms, :num_latrines, :num_teachers, :num_students, :num_sections, :phone_number, :postal_code, :speed_connectivity, :type_connectivity, :type_school, :water, :has_probe_data
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
  #   # column :name
  #   # column :lat
  #   # column :lon
  #   # column :category
  #   # column "Release Date", :released_at
  #   # column :price, :sortable => :price do |product|
  #   #   div :class => "price" do
  #   #     number_to_currency product.price
  #   #   end
  #   # end
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
      f.input :has_probe_data
      f.input :frequency
      f.input :latency_connectivity
      f.input :num_classrooms
      f.input :num_latrines
      f.input :num_teachers
      f.input :num_students
      f.input :num_sections
      f.input :phone_number
      f.input :postal_code
      f.input :speed_connectivity
      f.input :type_connectivity
      f.input :type_school
      f.input :water
    end
    f.actions
  end
end
