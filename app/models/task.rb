class Task < ApplicationRecord
   belongs_to :user 
   belongs_to :daily_checkin
   has_many :comments, dependent: :destroy
   has_many :users, through :comments #ppl who have commented on it

end
