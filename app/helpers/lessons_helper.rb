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
    @user_test = UserTest.create(user_id: current_user.id, test_day: I18n.l(Time.zone.now), result: @point)
    results.each do |result|
      question_id = result.values[1]
      answer_id = result.values[0]
      question = Question.find_by_question question_id
      answers = Answer.find_correct(question_id).number
      answers.each do |answer|
        answer = answer.content
        @lesson.test_details.create(user_test_id: @user_test.id,
          question: question, answer: answer)
      end
    end
    @user_test
  end

  end
