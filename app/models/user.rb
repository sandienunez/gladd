class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :commented_tasks, through: :comments, source: :tasks 
  #rename relationship and still have access to them 
  has_many :tasks #that user has created 
  validates :email, uniqueness: true, presence: true  
  has_secure_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end



