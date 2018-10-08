class CoursesController < ApplicationController
  before_action :load_course, only: [:update, :destroy]

  def new
    @course = Course.new
  end

  def index
    @courses = Course.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t ".create_success"
      redirect_to courses_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t ".update"
    else
      flash[:danger] = t ".can_not"
    end
      render :index
  end

  private

    def load_course
      @course = Course.find_by id: params[:id]
      return if @course
      flash[:danger] = "cant_find_course"
      render :new
    end

    def course_params
      params.require(:course).permit :title, :description, :content, :image
    end
end
