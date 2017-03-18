class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['http_auth_name'],
  :password => ENV['http_auth_password']

  def show
  end
end
