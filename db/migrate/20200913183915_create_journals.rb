class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.integer :user_id
      t.date :date 
      t.integer :focus
      t.integer :organization
      t.integer :impulse_control
      t.integer :worry
      t.integer :mood
      t.integer :temper_control
      t.integer :memory
      t.integer :anxiety
      t.integer :sleep
      t.integer :other
      t.text :notes
      t.text :reminders
      t.text :three_things_i_am_grateful_for
      t.text :negative_thoughts
      t.text :challenges
      t.string :breakfast
      t.string :snack_one
      t.string :lunch
      t.string :snack_two
      t.string :dinner
      t.integer :healthy
      t.text :how_did_i_feel_after
      t.time :time_eaten
      t.string :brain_health
      t.string :physical_health
      t.string :emotional_health
      t.string :thinking_patterns
      t.string :spouse
      t.string :children
      t.string :family_and_friends
      t.string :work
      t.string :school
      t.string :money
      t.string :spiritual_life
      t.string :character
      t.string :passions
      t.string :community_service
      t.string :giving_to_charity
      t.string :word_of_day
      t.string :bible_verse_of_day

      t.timestamps
    end
  end
end
