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

  def result_handle results
    @point = 0
    results.each do |result|
      question_id = result.values[1]
      answer_id = result.values[0]
      count_correct = Answer.find_correct(question_id).number.count
      answers = Answer.find_by_anwer answer_id
      if count_correct == answers.size
        answers.each do |answer|
          @check = answer.correct? ? true : false
          break unless @check
        end
        @point += 1 if @check
      end
    end
  end

  def set_data results
    ActiveRecord::Base.transaction do
      @lesson.user_tests.create(user_id: current_user.id ,test_day: I18n.l(Time.zone.now), result: @point)
      user_id = UserTest.find_user_test_id(current_user.id).first.user_test_id
      binding.pry
      results.each do |result|
        question_id = result.values[1]
        answer_id = result.values[0]
        question = Question.find_by_question question_id
        answers = Answer.find_correct(question_id).number
        answers.each do |answer|
          @lesson.test_details.create(user_test_id: user_test_id, lesson_id: @lesson.id, question: question, answer: answer)
        end
      end
    raise ActiveRecord::Rollback
    end
  end

  end
