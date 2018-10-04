class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
    @question.answers.build
  end

  def index
    @questions = Question.all.paginate page: params[:page],
      per_page: Settings.question.controller.perpage.ten
  end

  def create
    @question = Question.new question_params
    if check_exist_correct?
      if @question.save
        flash[:success] = t ".question_create"
        redirect_to questions_path
      else
        flash[:danger] = t ".can_not"
        render :new
      end
    else
      render :new
    end
  end


  def update
    if check_exist_correct?
      if @question.update_attributes question_params
        flash[:success] = t ".update"
        redirect_to questions_path
      else
        flash[:danger] = t ".can_not"
        render :edit
      end
    else
      render :new
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t ".question_destroy"
    else
      flash[:danger] = t ".can_not"
    end
    redirect_to questions_path
  end

  private

    def question_params
      params.require(:question).permit :content,
        answers_attributes: [:id, :content, :correct]
    end

    def load_question
      @question = Question.find_by id: params[:id]
      return if @question
      flash[:danger] = t ".not_question"
      render :new
    end

    def check_exist_correct?
      answers = params["question"]["answers_attributes"].values
      answers.each do |answer|
        return true if answer.values.include? Settings.question.controller.check.one
      end
      flash[:danger] = t ".correct_exist"
      false
    end
end
