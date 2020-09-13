class JournalsController < ApplicationController
    def new
        @journal = Journal.new  
    end

    def create
        # binding.pry
        @journal = current_user.journals.build(journal_params)
        if @journal.save
          redirect_to journals_path
        else
          render :new
        end
    end

    def edit 
     @journal = Journal.find_by_id(params[:id])
    end

    def show
        @journal = Journal.find_by_id(params[:id])
    end

    def index 
        @journal = Journal.all

    end

    def update
        @journal= Journal.find_by_id(params[:id])
        if  @journal.update(journal_params) && current_user.id == @daily_routine.user_id 
        redirect_to journals_path(@journal)
        end 
    end

    def destroy
        @journal = Journal.find_by_id(params[:id])
        # binding.pry
        if current_user.id == @journal.user_id
            @journal.destroy
        end
        redirect_to journals_path
    end

    private

    def journal_params
        params.require(:journal).permit(:date, :"date(2i)", :focus, :organization, :impulse_control, :worry, :mood, :temper_control, :memory, :anxiety, :sleep, :other, :notes, :reminders, :three_things_i_am_grateful_for, :negative_thoughts, :challenges, :breakfast, :snack_one, :lunch, :snack_two, :dinner, :healthy, :how_did_i_feel_after, :time_eaten, :brain_health, :physical_health, :emotional_health, :thinking_patterns, :spouse, :children, :family_and_friends, :work, :school, :money, :spiritual_life, :character, :passions, :community_service, :giving_to_charity, :word_of_day, :bible_verse_of_day)
    end


end