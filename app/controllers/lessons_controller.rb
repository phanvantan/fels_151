class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update]

  def new
    @lesson = Lesson.new
    @question = @lesson.questions.build
    @answer = @lesson.answers.build
  end

  def create
    @lesson = Lesson.new lesson_params
  end

  def show; end

  def update
    binding.pry
    @lesson = Lesson.new lesson_params
    @question = @lesson["title"]
  end
  private
    def load_lesson
      @lesson = Lesson.find_by id: params[:id]
      return if @lesson
      redirect_to root_url
    end

    def lesson_params
      params.require(:lesson).permit :title,
        questions_attributes: [:id, :content],
          answers_attributes: [:id, :content, :correct]
    end
end
