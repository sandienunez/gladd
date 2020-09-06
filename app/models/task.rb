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
      today_tasks = user.tasks.select do |t|
         t.created_at.try(:to_date) == Date.today
      end

      if today_tasks.size > 2
         errors.add(:task_id, "error: In order to ensure that you focus on finishing your tasks, you can't add more then 2 tasks per day.")
      end 
   end
end

         #try method tries to call to_date method and if it causese error return value is nil
    #binding.pry 
      #inside of here we have access to instance method and we can see self
      #check if: are there already 2 tasks added to the db with created_at as current date
      #iterate over user's tasks

   #if we dont meet requirements #check for negative 
      #add error for that attribute
      #else
      #we do nothing 
