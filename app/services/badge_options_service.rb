class BadgeOptionsService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      add_badge!(badge) if send("rule_#{badge.rule}?", badge.rule_parameter)
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end

  def rule_1?(category)
    # all tests category?
    if @test_passage.test.category.title == category
      corrects_count = TestPassage.correct_passed_tests(@user)
                                  .pluck('DISTINCT test_id')
                                  .count
      Category.find_by(title: category).tests.count == corrects_count
    end
  end

  def rule_2?(test_title)
    # test first try?
    if @test_passage.test.title == test_title && @test_passage.passed
      @user.tests.where(title: test_title).count == 1
    end
  end

  def rule_3?(level)
    # test certaion level?
    @test_passage.test.level == level.to_i if @test_passage.passed
  end
end
