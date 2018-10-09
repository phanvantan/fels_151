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
end
