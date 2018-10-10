class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update, :destroy, :number_correct, :mark]
  before_action :load_course, only: [:create, :destroy]

  def new
    @lesson = Lesson.new
    @question = @lesson.questions.build
    @answer = @question.answers.build
    @course = Course.new
  end

  def index
    @lessons = Lesson.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end


  def edit; end

  def show; end

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
      flash[:success] = t "destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to course_lessons_path(@course)
  end

  def update
    @point = 0
    results  = params["lesson"]["questions_attributes"].values
    results.each do |result|
      question_id = result.values[1]
      answer_id = result.values[0]
      @point +=1 if check_result(question_id, answer_id)
    end

    redirect_to test_detail_path
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
