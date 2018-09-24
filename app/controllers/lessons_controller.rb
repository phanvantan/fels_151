class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
    @lesson.lesson_questions.build
  end

  def create
    @lesson = Lesson.new params[:lesson]
  end

  def show; end
end
