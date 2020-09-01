class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :task_name
      t.string :prayer
      t.string :exercise
      t.text :vitamins
      t.text :daily_plan
      t.string :stretch
      t.text :diet

      

      t.timestamps
    end
  end
end
