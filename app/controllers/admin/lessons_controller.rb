class Admin::LessonsController < Admin::AdminsController
  before_action :new_lesson, only: :index
  before_action :load_courses, except: [:show, :destroy]
  before_action :load_lesson, only: [:show, :destroy, :update, :edit]

  def new
    @lesson = Lesson.new
  end

  def edit; end

  def index
    @q = Lesson.search(params[:q])
    @lessons = @q.result(distinct: true)
              .page(params[:page])
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = t ".create_success"
      redirect_to admin_lessons_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    redirect_to admin_lessons_path
  end

  def destroy
    if @lesson.destroy
      flash[:success] = t ".destroy_success"
      @lessons = Lesson.all
    else
      flash[:danger] = t ".destroy_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

    def new_lesson
      @lesson = Lesson.new
    end

    def load_lesson
      @lesson = Lesson.find_by id: params[:id]
      return if @lesson
      flash[:danger] = t ".not_found"
      redirect_to admin_lessons_path
    end

    def load_courses
      @courses = Course.select :id, :title
    end

    def lesson_params
      params.require(:lesson).permit :course_id, :title
    end
end
