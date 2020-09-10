class RenameDailyCheckinToDailyRoutine < ActiveRecord::Migration[6.0]
  def change
    rename_table :daily_checkins, :daily_routines
  end
end
