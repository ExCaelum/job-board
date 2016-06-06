# This is the welcome controller, controls homepage
class WelcomeController < ApplicationController
  skip_before_action :require_log_in

  def index
  end
end
