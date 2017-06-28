ActiveAdmin.register School do
  active_admin_import validate: true,

  before_batch_import: proc { |import|

    import.headers["country"] = :country
    import.batch_replace(:country, { nil =>  import.file.original_filename} )


    #  importer.headers["country"] = :country
    #  importer.batch_replace(:country, { nil =>  Thread.current['import.library_id']} )

    #  binding.pry
    #  import.file #current file used
    #  import.resource #ActiveRecord class to import to
    #  import.options # options
    #  import.result # result before bulk iteration
    #  import.headers # CSV headers
    # import.headers.merge({country: 'country'})
    # import.csv_lines.each do |line| line.push('Malawi') end
    #  import.csv_lines #lines to import
    #  import.model #template_object instance

  },
  after_batch_import: proc{ |import|
    puts '2222'
     #the same
  }


  # active_admin_importable do |model, thing|
  #   puts thing
  #   binding.pry
  #
  #   #  store = Store.find_by_name(hash[:store_name])
  #   #  hash[:store_id] = store.id
  #   #  hash.delete(:store_name)
  #   #  model.create!(hash)
  # end
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
  index do
    selectable_column
    id_column
    column :country_code
    column :name
    column :lat
    column :lon
    # column :category
    # column "Release Date", :released_at
    # column :price, :sortable => :price do |product|
    #   div :class => "price" do
    #     number_to_currency product.price
    #   end
    # end

  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :country_code, as: :country
      f.input :lat
      f.input :lon
    end
    f.actions
  end
end
