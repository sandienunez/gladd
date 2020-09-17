class DailyRoutine < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :users

    validates :daily_plan, :date, presence: true  
end

