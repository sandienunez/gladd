class Comment < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :task, optional: true 
validates :message, presence: true 
# validates :task, uniqueness: { scope: :user_id,
# message: "error: Sorry! You can only comment once for each task." }

# def task_attributes=(hash)
#     binding.pry
  
# end


end
