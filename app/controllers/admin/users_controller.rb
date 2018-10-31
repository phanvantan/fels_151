class Admin::UsersController < Admin::AdminsController
  before_action :new_user, only: :index
  before_action :load_user, only: [:update, :destroy, :edit, :show]
  def new
    @course = User.new
  end

  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
              .page(params[:page])
  end

  def create

  end

  private
    def new_user
      @user = User.new
    end

    def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = "cant_find_course"
      render :index
    end

    def user_params
      params.require(:course).permit :name, :email, :password,
        :password_confirmation
    end
end
