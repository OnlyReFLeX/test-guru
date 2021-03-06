class Question < ApplicationRecord
  validates :body, presence: true

  belongs_to :test
  has_many :answers
  has_many :gists
end
