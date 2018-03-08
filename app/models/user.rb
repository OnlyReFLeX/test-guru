class User < ApplicationRecord
  validates :login, :password, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
end
