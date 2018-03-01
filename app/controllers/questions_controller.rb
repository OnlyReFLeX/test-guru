class QuestionsController < ApplicationController
  def index
    @questions = Question.where(test_id: params[:test_id])
    render inline:  "<% @questions.each do |q| %><p><%= q.body %></p><% end %>"
  end
end
