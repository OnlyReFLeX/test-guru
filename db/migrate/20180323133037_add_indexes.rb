class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :answers, :question_id
    add_index :questions, :test_id
  end
end
