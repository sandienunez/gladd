class Comment < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :task
validates :message, presence: true 
validates :task, uniqueness: { scope: :user_id,
message: "error: Sorry! You can only comment once for each task." }
end
