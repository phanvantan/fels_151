class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def index
    @questions = Question.all.paginate page: params[:page],
      per_page: Settings.paginate.default
  end


  private

    def load_question
      @question = Question.find_by id: params[:id]
      return if @question
      flash[:danger] = t ".not_question"
      redirect_to new_course_lesson_question_path(params[:course_id],
        params[:lesson_id])
    end
end
