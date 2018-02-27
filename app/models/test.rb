class Test < ApplicationRecord
  validates :title, presence: true
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }
  validates :title, uniqueness: { scope: :level }

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_user
  has_many :users, through: :tests_user

  scope :level, ->(level) { where(level: level) }
  scope :level_easy, -> { level(0..1) }
  scope :level_medium, -> { level(2..4) }
  scope :level_hard, -> { level(5..Float::INFINITY) }
  scope :by_category, lambda { |category_title|
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category_title })
        .order(title: :DESC)
  }

  def self.category_by_title(category_title)
    Test.by_category(category_title).pluck(:title)
  end
end
