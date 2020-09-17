class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :commented_tasks, through: :comments, source: :tasks #tasks they commented on 
  has_many :tasks #that user has created 
  #is this still needed since i have a Task belongs_to :user assocation, if i already established relationship above?
  #if often has_many is on other side of a belongs_to assosciation 
  has_many :journals 

  validates :email, uniqueness: true, presence: true  
  validates_presence_of :full_name
  #has_secure_password not needed bc of devise 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable ## modules coming from devise
  

  def self.from_omniauth(auth)  ## A custom class constructor I'm building myself
    # binding.pry
          ## check and see if a user with this provider (github) and uid exists; if not, create it
      where(provider: auth.provider, uid: auth.id).first_or_create do |user|
        user.provider = auth.provider ## so I know this user has authenticated with github previously
        user.full_name = auth.info.name
        user.uid = auth.id  ## so I know this user has authenticated with github previously, and I don't make a duplicate user
        user.email = auth.info.email
        user.password = Devise.friendly_token(20) ## dummy password to store in my app db
      end
  end
end



