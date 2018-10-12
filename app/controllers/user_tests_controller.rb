class UserTestsController < ApplicationController
  before_action :load_user_test, only: :show

  def new
    @user_test = UserTest.new
  end

  def create;end

  def show; end

  private

    def load_user_test
      @user_test = UserTest.find_by id: params[:id]
      return if @user_test
      flash[:danger] = t ".not_found"
      redirect_to root_url
    end

end
