class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :update, :destroy]
  before_action :load_course, only: [:create, :update, :destroy]
  before_action :load_lesson, only: [:create, :update, :destroy]

  def new
    @question = Question.new
    @question.answers.build
    @course = Course.new
    @lesson = Lesson.new
  end

  def index
    @questions = Question.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end

  def create
    @question = Question.new question_params
    if check_exist_correct? && @question.save
      flash[:success] = t ".question_create"
      redirect_to course_lesson_questions_path(@course, @lesson)
    else
      flash[:danger] = t ".can_not"
      redirect_to new_course_lesson_question_path(@course, @lesson)
    end
  end


  def update
    if check_exist_correct? && @question.update_attributes(question_params)
      flash[:success] = t ".update"
      redirect_to course_lesson_questions_path(@course, @lesson)
    else
      flash[:danger] = t ".can_not"
      redirect_to edit_course_lesson_question_path(@course, @lesson)
    end
  end

  def destroy
    binding.pry
    if @question.destroy
      flash[:success] = t ".question_destroy"
    else
      flash[:danger] = t ".can_not"
    end
    redirect_to course_lesson_questions_path(params[:course_id], params[:lesson_id])
  end

  private

    def question_params
      params.require(:question).permit :lesson_id, :content,
        answers_attributes: [:id, :content, :correct]
    end

    def load_lesson
      @lesson = Lesson.find_by id: params[:lesson_id]
      return if @lesson
      redirect_to root_url
    end

    def load_course
      @course = Course.find_by id: params[:course_id]
      return if @course
      redirect_to root_url
    end

    def load_question
      @question = Question.find_by id: params[:id]
      return if @question
      flash[:danger] = t ".not_question"
      redirect_to new_course_lesson_question_path(params[:course_id], params[:lesson_id])
    end

    def check_exist_correct?
      answers = params["question"]["answers_attributes"].values
      answers.each do |answer|
        return true if answer.values.include? "1"
      end
      flash[:danger] = t ".correct_exist"
      false
    end
end
