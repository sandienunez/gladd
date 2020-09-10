class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :task_name
      t.text :action_one
      t.text :action_two
      t.text :action_three


      

      t.timestamps
    end
  end
end

