class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: @test_id)
    render inline:  "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = Question.create(body: question_params[:body], test_id: @test_id)
    render plain: question.body
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test_id = params[:test_id]
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Ресурс не найден.'
  end
end
