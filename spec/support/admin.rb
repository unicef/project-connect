# frozen_string_literal: true
def add_school_resource(options = {}, &block)
  ActiveAdmin.register School do
    config.filters = false
    active_admin_import(options, &block)
  end
  Rails.application.reload_routes!
end
