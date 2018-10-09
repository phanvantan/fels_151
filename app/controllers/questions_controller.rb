class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
    @question.answers.build
  end

  def index
    @questions = Question.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end

  def create
    @question = Question.new question_params
    if check_exist_correct? && @question.save
      flash[:success] = t ".question_create"
      redirect_to course_lesson_questions_path(params[:course_id], params[:lesson_id])
    else
      flash[:danger] = t ".can_not"
      redirect_to new_course_lesson_question_path(params[:course_id], params[:lesson_id])
    end
  end


  def update
    if check_exist_correct? && @question.update_attributes(question_params)
      flash[:success] = t ".update"
      redirect_to course_lesson_questions_path(params[:course_id], params[:lesson_id])
    else
      flash[:danger] = t ".can_not"
      redirect_to edit_course_lesson_question_path(params[:course_id], params[:lesson_id])
    end
  end

  def destroy
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
