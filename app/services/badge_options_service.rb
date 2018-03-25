class BadgeOptionsService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      case badge.rule
      when 1
        add_badge!(badge) if all_tests_category?(badge.rule_parameter)
      when 2
        add_badge!(badge) if test_first_try?(badge.rule_parameter)
      when 3
        add_badge!(badge) if test_certaion_level?(badge.rule_parameter.to_i)
      end
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end

  def all_tests_category?(category)
    if @test_passage.category.title = category
      corrects_count = TestPassage.correct_passed_tests(@user)
                                  .pluck('DISTINCT test_id')
                                  .count
      Category.find_by(title: category)&.tests&.count == corrects
    end
  end

  def test_first_try?(test)

  end

  def test_certaion_level?(level)
  end
end
