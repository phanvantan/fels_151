class Admin::AdminsController < ApplicationController
  include Count
  layout "admin"
  before_action :logged_in_user, :admin_user

  def index
    @admin = Admin::AdminsController.new
  end

end
