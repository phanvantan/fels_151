class CoursesController < ApplicationController
before_action :load_course, only: :show
  def new
    @course = Course.new
  end

  def index
    @courses = Course.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end
  def show

  end

private
  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t ".cant_find_course"
    redirect_to courses_path
  end
end
