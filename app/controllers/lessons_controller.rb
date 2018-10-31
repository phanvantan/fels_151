class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update]

  def new
    @lesson = Lesson.new
    @lesson.questions.build
    @lesson.answers.build
  end

  def index
    @lessons = Lesson.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end

  def edit; end

  def show
    @questions = @lesson.questions
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
end
