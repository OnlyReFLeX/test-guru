class User < ApplicationRecord
  def open_tests_by_level(level)
    Test.joins('JOIN users_tests ON users_tests.test_id = tests.id')
        .where("users_tests.user_id = #{self.id} AND tests.level = ?", level)
  end
end
