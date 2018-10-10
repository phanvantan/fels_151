module LessonsHelper

  def number_correct question
    a = Settings.helper.lesson.zero
    question.answers.each do |answer|
      check = answer.correct
      a += Settings.helper.lesson.one if check
    end
    return true if a > Settings.helper.lesson.one
    false
  end

  def check_result(question_id, answer_id)
    @question = Question.find_by_question question_id
    @answers = Answer.find_by_anwer answer_id
    @answers.each do |answer|
      @test = answer.correct? ? true : false
      @lesson
      binding.pry
    end
    return @test
  end

  def set_data_user_test_detail
    @lesson
    binding.pry
  end
end
