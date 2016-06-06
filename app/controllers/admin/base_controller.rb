# BaseController for the admin namespace
class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: '/public/error' unless current_admin?
  end
end
