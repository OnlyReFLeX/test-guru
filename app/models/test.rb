class Test < ApplicationRecord
  def self.category_by_title(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title = ?', title)
        .order('title DESC')
  end
end
