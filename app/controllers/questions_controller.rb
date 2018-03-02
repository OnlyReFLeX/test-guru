class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render inline:  "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.body
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос успешно удален'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Ресурс не найден.'
  end
end
