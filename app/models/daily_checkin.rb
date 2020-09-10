class DailyRoutine < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :tasks 
    validates :emotional_scale, :tasks_completed, :went_well_tips, :bad_tips
end
