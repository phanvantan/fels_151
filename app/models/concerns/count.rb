module Count
  def courses_count
    Course.select(:id).size
  end

  def lessons_count
    Lesson.select(:id).size
  end

  def questions_count
    Question.select(:id).size
  end

  def users_count
    User.select(:id).size
  end

  def words_count
    Word.select(:id).size
  end
end
