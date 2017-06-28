require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { address: @school.address, admin0: @school.admin0, admin1: @school.admin1, admin2: @school.admin2, admin3: @school.admin3, admin4: @school.admin4, admin_code: @school.admin_code, admin_id: @school.admin_id, altitude: @school.altitude, availability_connectivity: @school.availability_connectivity, connectivity: @school.connectivity, country: @school.country, country_code: @school.country_code, datasource_id: @school.datasource_id, description: @school.description, educ_level: @school.educ_level, electricity: @school.electricity, environment: @school.environment, filename: @school.filename, frequency: @school.frequency, lat: @school.lat, latency_connectivity: @school.latency_connectivity, lon: @school.lon, name: @school.name, num_classrooms: @school.num_classrooms, num_latrines: @school.num_latrines, num_sections: @school.num_sections, num_students: @school.num_students, num_teachers: @school.num_teachers, phone_number: @school.phone_number, postal_code: @school.postal_code, speed_connectivity: @school.speed_connectivity, type_conectivity: @school.type_conectivity, type_school: @school.type_school, water: @school.water } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { address: @school.address, admin0: @school.admin0, admin1: @school.admin1, admin2: @school.admin2, admin3: @school.admin3, admin4: @school.admin4, admin_code: @school.admin_code, admin_id: @school.admin_id, altitude: @school.altitude, availability_connectivity: @school.availability_connectivity, connectivity: @school.connectivity, country: @school.country, country_code: @school.country_code, datasource_id: @school.datasource_id, description: @school.description, educ_level: @school.educ_level, electricity: @school.electricity, environment: @school.environment, filename: @school.filename, frequency: @school.frequency, lat: @school.lat, latency_connectivity: @school.latency_connectivity, lon: @school.lon, name: @school.name, num_classrooms: @school.num_classrooms, num_latrines: @school.num_latrines, num_sections: @school.num_sections, num_students: @school.num_students, num_teachers: @school.num_teachers, phone_number: @school.phone_number, postal_code: @school.postal_code, speed_connectivity: @school.speed_connectivity, type_conectivity: @school.type_conectivity, type_school: @school.type_school, water: @school.water } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end
