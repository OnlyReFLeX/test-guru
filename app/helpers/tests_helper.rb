module TestsHelper
  def test_header(test)
    if test.new_record?
      t('.create_test')
    else
      t('.edit_test')
    end
  end
end
