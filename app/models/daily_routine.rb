class DailyRoutine < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :tasks 
    validates :daily_plan, :prayer_or_meditations, :exercise_plan, :stretch_plan, :three_superfoods_to_add_to_my_meals, :emotional_scale, :tasks_completed, :went_well_tips, :bad_tips
end
