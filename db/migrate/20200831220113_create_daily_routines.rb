class CreateDailyRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_routines do |t|
      t.integer :user_id
      t.text :daily_plan 
      t.string :prayer_or_meditations
      t.text :exercise_plan
      t.text :stretch_plan
      t.text :three_superfoods_to_add_to_my_meals
      t.date :date

      t.timestamps
    end
  end
end
