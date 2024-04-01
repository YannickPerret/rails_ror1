# ==============================================================================
# Filename : application_helper.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
