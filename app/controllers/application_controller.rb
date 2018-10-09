class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include LessonsHelper
  
  def check_admin?
    current_user.admin?
  end
end
