class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_user
  has_many :users, through: :tests_user

  def self.category_by_title(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: title })
        .order(title: :DESC)
        .pluck('tests.title')
  end
end
