# ==============================================================================
# Filename : application_controller.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :current_user
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
