class Task < ApplicationRecord
   scope :priority_order, -> { order(priority_ranking: :desc)}
                                 
   #when we call on scope in controller we get = ActiveRecord::Relation object
   
   belongs_to :user, optional: true  
   has_many :comments, dependent: :destroy
   has_many :users, through: :comments #ppl who have commented on it #joint table is comments
   validates :task_name, :action_one, :action_two, :action_three, :date, :priority_ranking, presence: true 
   validate :limit_number_of_tasks, on: :create

   def limit_number_of_tasks
      # binding.pry
      if user.tasks.size > 5 
         errors.add(:base, "Error: To help you focus on finishing your tasks, you cannot add more then 6 tasks per day.")
      else 
         @tasks = Task.priority_order
      end

   end

end