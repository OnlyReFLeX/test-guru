class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = Question.where(test_id: params[:test_id])
    render inline:  "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end

  def show
    render inline: @question.body
  end

  def new
  end

  def create
    question = Question.create(body: question_params[:body], test_id: params[:test_id])
    render inline: @question.body
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
