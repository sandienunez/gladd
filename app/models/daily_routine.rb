class DailyRoutine < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :comments, dependent: :destroy
    validates :daily_plan, :date, presence: true  
end
