class Journal < ApplicationRecord
    belongs_to :user, optional: true 
    # has_many :comments, dependent: :destroy
    has_many :users
    validates :date, :word_of_day, presence: true  
end
