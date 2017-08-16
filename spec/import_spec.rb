# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

RSpec.describe 'import', type: :feature do
  def upload_file!(dir, name, ext = 'csv')
    attach_file('active_admin_import_model_file', File.expand_path("./spec/fixtures/#{dir}/#{name}.#{ext}"))
    find_button('Import').click
  end

  def create_user
      AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
  end

  def login
    # add_school_resource(options)
    visit '/admin/schools/import'
    fill_in 'admin_user_password', with: 'password'
    fill_in 'admin_user_email', with: 'admin@example.com'
    first('input[type="submit"]').click
  end

  context 'When csv with same name is uploaded twice' do
    before do
      create_user
      login
      visit '/admin/schools/import'
    end

    it 'should not replace old ones if file fails validation' do
      visit '/admin/schools/import'
      upload_file!('files', 'BR-zzzz-0-ZZZZ-1')
      expect(School.count).to eq(2)
      upload_file!('files', 'CO-aaaa-0-AAAA-1')
      expect(School.count).to eq(4)
      expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').first.admin1).to eq('One')
      p 'AAAAAAA'
      upload_file!('files_bad', 'BR-zzzz-0-ZZZZ-1')
      p 'BBBBBBBBB'
      expect(School.count).to eq(4)
      expect(page).to have_content 'unknown attribute'
      expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').first.admin1).to eq('One')
      expect(School.where(datasource: 'CO-aaaa-0-AAAA-1.csv').count).to eq(2)
      expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').count).to eq(2)
      expect(School.count).to eq(4)
      # expect(School.where(datasource: 'CO-aaaa-0-AAAA-1.csv').count).to eq(2)
      # expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').count).to eq(2)
      # expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').first.admin1).to eq('Three')
      # p page.html
    end
  end

  context 'When csv with same name is uploaded twice' do
    before do
      create_user
      login
      visit '/admin/schools/import'
    end

    it 'should replace old records with new ones' do
      visit '/admin/schools/import'
      upload_file!('files', 'BR-zzzz-0-ZZZZ-1')
      upload_file!('files', 'CO-aaaa-0-AAAA-1')
      expect(School.count).to eq(4)
      expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').first.admin1).to eq('One')
      upload_file!('files_good', 'BR-zzzz-0-ZZZZ-1')
      expect(School.where(datasource: 'CO-aaaa-0-AAAA-1.csv').count).to eq(2)
      expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').count).to eq(2)
      expect(School.where(datasource: 'BR-zzzz-0-ZZZZ-1.csv').first.admin1).to eq('Three')
      # p page.html
    end
  end

end
