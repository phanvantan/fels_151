class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update, :destroy, :number_correct]
  before_action :load_course, only: [:create, :destroy, :index]

  def new
    @lesson = Lesson.new
    @course = Course.new
    @question = @lesson.questions.build
    @answer = @question.answers.build
  end

  def index
    @lessons = Lesson.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end

  def edit; end

  def show
    @questions = @lesson.questions.paginate page: params[:page],
      per_page: Settings.paginate.default
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = t ".create_success"
      redirect_to course_lessons_path(@course)
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def destroy
    if @lesson.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to course_lessons_path(@course)
  end

  def update
    results = params["lesson"]["questions_attributes"].values
    if results
      result_handle results
      user_test = set_data results
      redirect_to user_test_path user_test
    else
      flash[:danger] = t ".data_fail"
      redirect_to course_lessons_path(@course)
   end
 end


  private

    def load_lesson
      @lesson = Lesson.find_by id: params[:id]
      return if @lesson
      redirect_to root_url
    end

    def load_course
      @course = Course.find_by id: params[:course_id]
      return if @course
      redirect_to root_url
    end

    def lesson_params
      params.require(:lesson).permit :course_id, :title
    end
end
