class Task < ApplicationRecord
   scope :priority_order, -> { order(task_name: :desc)}
                            #attribute

   #when we call scope we get = ActiveRecord::Relation object
   belongs_to :user, optional: true 
   belongs_to :daily_checkin, optional: true 
   has_many :comments, dependent: :destroy
   has_many :users, through: :comments #ppl who have commented on it
   validates :task_name, :prayer, :exercise, :supplements, :daily_plan, :stretch, :diet, presence: true 
   validate :limit_number_of_tasks

   def limit_number_of_tasks

   end
end
