module TestPassagesHelper
  def result_percent_color(percent)
    if @test_passage.test_passed?
      "<span style='color: green'>#{percent}%</span>".html_safe
    else
      "<span style='color: red'>#{percent}%</span>".html_safe
    end
  end
end
