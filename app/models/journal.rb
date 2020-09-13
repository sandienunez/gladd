class Journal < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :comments, dependent: :destroy
    validates :date, :focus, :organization, :impulse_control, :worry, :mood, :temper_control, :memory, :anxiety, :sleep, :other, :notes, :reminders, :three_things_i_am_grateful_for, :negative_thoughts, :challenges, :breakfast, :snack_one, :lunch, :snack_two, :dinner, :healthy, :how_did_i_feel_after, :time_eaten, :brain_health, :physical_health, :emotional_health, :thinking_patterns, :spouse, :children, :family_and_friends, :work, :school, :money, :spiritual_life, :character, :passions, :community_service, :giving_to_charity, :word_of_day, :bible_verse_of_day, presence: true  
end
