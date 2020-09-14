class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :daily_routine_id
      t.integer :journal_id
      t.string :message

      t.timestamps
    end
  end
end
