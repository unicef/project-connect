class SchoolsController < InheritedResources::Base

  private

    def school_params
      params.require(:school).permit(:address, :admin0, :admin1, :admin2, :admin3, :admin4, :admin_code, :admin_id, :altitude, :availability_connectivity, :connectivity, :country, :country_code, :datasource_id, :description, :educ_level, :electricity, :environment, :filename, :frequency, :latency_connectivity, :lat, :lon, :name, :num_classrooms, :num_latrines, :num_teachers, :num_students, :num_sections, :phone_number, :postal_code, :speed_connectivity, :type_conectivity, :type_school, :water)
    end
end

