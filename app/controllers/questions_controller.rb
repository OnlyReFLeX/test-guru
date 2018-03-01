class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = Question.where(test_id: params[:test_id])
    render inline:  "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end

  def show
    render inline: @question.body
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
end
