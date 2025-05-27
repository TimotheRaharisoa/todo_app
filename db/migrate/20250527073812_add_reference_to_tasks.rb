class AddReferenceToTasks < ActiveRecord::Migration[8.0]
  def change
    add_reference :tasks, :user, foreign_key: true
  end
  add_index :tasks, :title
  add_index :tasks, :completed
  add_index :tasks, :due_date
  add_index :tasks, :priority
end
