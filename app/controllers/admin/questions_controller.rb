class Admin::QuestionsController < Admin::AdminsController
  before_action :new_question, only: :index
  before_action :load_lessons, except: [:show, :destroy]
  before_action :load_question, only: [:show, :destroy, :update, :edit]

  def new
    @question = Question.new
    @question.answers.build
  end

  def edit; end

  def index
    @q = Question.search(params[:q])
    @questions = @q.result(distinct: true)
              .page(params[:page])
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t ".create_success"
      redirect_to admin_questions_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    redirect_to admin_questions_path
  end

  def destroy
    if @question.destroy
      flash[:success] = t ".destroy_success"
      @questions = Question.all
    else
      flash[:danger] = t ".destroy_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

    def new_question
      @question = Question.new
    end

    def load_question
      @question = Question.find_by id: params[:id]
      return if @question
      flash[:danger] = t ".not_found"
      redirect_to admin_questions_path
    end

    def load_lessons
      @lessons = Lesson.select :id, :title
    end

    def question_params
      params.require(:question).permit :lesson_id, :content, :category,
        answers_attributes: [:id, :content, :correct]
    end

    def check_exist_correct
      arr = []
      answers = params["question"]["answers_attributes"].values
      answers.each do |answer|
        a = answer["correct"]
        arr << a if a == "1"
      end
      @number = arr.size
    end
end
