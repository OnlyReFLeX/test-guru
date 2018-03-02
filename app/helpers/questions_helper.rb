module QuestionsHelper
  def question_header
    if @question.new_record?
      "Создание нового вопроса для теста #{@question.test.title}"
    else
      "Редактирование вопроса для теста #{@question.test.title}"
    end
  end
end
