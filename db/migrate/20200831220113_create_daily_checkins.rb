class CreateDailyCheckins < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_checkins do |t|
      t.integer :emotional_scale
      t.boolean :tasks_completed
      t.string :went_well_tips
      t.string :bad_tips

      t.timestamps
    end
  end
end
