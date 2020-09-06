class Task < ApplicationRecord
   scope :priority_order, -> { order(task_name: :desc)}
                            #attribute

   #when we call scope we get = ActiveRecord::Relation object
   belongs_to :user, optional: true 
   belongs_to :daily_checkin, optional: true 
   has_many :comments, dependent: :destroy
   has_many :users, through: :comments #ppl who have commented on it

end
