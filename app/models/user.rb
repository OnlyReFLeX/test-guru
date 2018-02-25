class User < ApplicationRecord
  has_many :tests_user
  has_many :tests, through: :tests_user
  has_many :my_tests, class_name: 'Test', foreign_key: 'author_id'

  def open_tests_by_level(level)
    Test.joins('JOIN users_tests ON users_tests.test_id = tests.id')
        .where(users_tests: { user_id: self.id }, level: level)
  end
end
