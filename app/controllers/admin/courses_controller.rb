class Admin::CoursesController < Admin::AdminsController
  before_action :new_course, only: :index
  before_action :load_course, only: [:update, :destroy, :edit, :show]

  def new
    @course = Course.new
  end

  def index
    @q = Course.search(params[:q])
    @courses = @q.result(distinct: true)
              .page(params[:page])
  end


  def create
    @course = Course.new course_params
    if @course.save
      @courses = Course.all
      flash[:success] = t ".create_success"
      new_course
    else
      flash[:danger] = t ".create_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @course.update_attributes course_params
      @courses = Course.all
      new_course
      flash[:success] = t ".update"
    else
      flash[:danger] = t ".can_not"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @course.destroy
      @courses = Course.all
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".can_not"
    end
    respond_to do |format|
      format.js
    end
  end


  private

    def new_course
      @course = Course.new
    end

    def load_course
      @course = Course.find_by id: params[:id]
      return if @course
      flash[:danger] = "cant_find_course"
      render :index
    end

    def course_params
      params.require(:course).permit :title, :description, :content, :picture
    end
end
