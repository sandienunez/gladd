class DailyRoutine < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :task, optional: true 
    has_many :comments, dependent: :destroy
    has_many :users
    validates :daily_plan, :date, presence: true  
end
