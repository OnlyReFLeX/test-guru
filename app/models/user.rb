class User < ApplicationRecord
  EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, format: EMAIL_FORMAT, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
