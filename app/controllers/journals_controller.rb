class JournalsController < ApplicationController
before_action :authenticate_user!

    def new
        @journal = Journal.new  
    end

    def index 
        @journals = Journal.all

    end

    def create
    @journal = Journal.new(journal_params)
        if @journal.save
            redirect_to journal_path(@journal)
        else 
            render :new
        end 
    end

    def edit 
        set_journal
    end

    def show
        set_journal
    end


    def update
        set_journal
            if  @journal.update(journal_params) && current_user.id == @journal.user_id 
                redirect_to journals_path(@journal)
            end 
    end

    def destroy
        set_journal
            if current_user.id == @journal.user_id
                @journal.destroy
            end
            redirect_to journals_path
    end

    private

    def set_journal
        @journal = Journal.find_by_id(params[:id])
            if !@journal || @journal.user != current_user
                redirect_to journals_path, notice: "Sorry! Tasky penguin says you're not authorized to view this Daily Journal! So flap your wings out of here!"
            end
    end


    def journal_params
        params.require(:journal).permit(:date, :"date(2i)", :focus, :organization, :impulse_control, :worry, :mood, :temper_control, :memory, :anxiety, :sleep, :notes, :reminders, :three_things_i_am_grateful_for, :negative_thoughts, :challenges, :breakfast, :snack_one, :lunch, :snack_two, :dinner, :healthy, :how_did_i_feel_after, :brain_health, :physical_health, :emotional_health, :thinking_patterns, :spouse, :children, :family_and_friends, :work, :school, :money, :spiritual_life, :character, :passions, :community_service, :giving_to_charity, :word_of_day, :bible_verse_of_day, :user_id)
    end


end