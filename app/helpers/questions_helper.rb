module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('.header_new', title: question.test.title)
    else
      t('.header_edit', title: question.test.title)
    end
  end
end
