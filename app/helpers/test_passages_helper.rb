module TestPassagesHelper
  def result_procent_color(procent)
    if @test_passage.test_passed?
      "<span style='color: green'>#{procent}%</span>".html_safe
    else
      "<span style='color: red'>#{procent}%</span>".html_safe
    end
  end
end
