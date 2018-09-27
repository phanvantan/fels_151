class UserTestsController < ApplicationController
  before_action :load_lesson, only: [:new]

  def new
    @user_test = UserTest.new(lesson_id: params[:lesson_id], user_id: current_user.id)
    @lesson.lesson_questions.each do |lesson_question|
      lesson_question.question.answers.do |answer|
        @user_test.test_details.build lesson_question_id: lesson_question.id
      end
    end
  end

  def create
  end

  def show
  end


  private
    def load_lesson
      binding.pry
      @lesson = Lesson.find_by id: params[:lesson_id]
      return if @lesson
      redirect_to root_url
    end
end
