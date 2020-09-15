class JournalsController < ApplicationController
    def new
        if user_signed_in?
            @journal = Journal.new  
        else 
            redirect_to '/'
        end 
    end

    def index 
        if user_signed_in?
            @journals = Journal.all
        else 
            redirect_to '/'
        end 
    end

    def create
        if user_signed_in?
            @journal = Journal.new(journal_params)
                if @journal.save
                    redirect_to journal_path(@journal)
                else 
                    render :new
                end 
        else 
            redirect_to '/'
        end 
    end

    def edit 
        if user_signed_in?
            set_journal
        else 
            redirect_to '/'
        end 
    end

    def show
        if user_signed_in?
            set_journal
        else 
            redirect_to '/'
        end 
    end


    def update
        if user_signed_in?
            set_journal
                if  @journal.update(journal_params) && current_user.id == @journal.user_id 
                    redirect_to journals_path(@journal)
                end 
        else 
            redirect_to '/'
        end 
    end

    def destroy
        if user_signed_in?
            set_journal
                if current_user.id == @journal.user_id
                    @journal.destroy
                end
            redirect_to journals_path
        else 
            redirect_to '/'
        end 
    end

    private

    def set_journal
        @journal = Journal.find_by_id(params[:id])
            if !@journal
                redirect_to journals_path
            end
    end


    def journal_params
        params.require(:journal).permit(:date, :"date(2i)", :focus, :organization, :impulse_control, :worry, :mood, :temper_control, :memory, :anxiety, :sleep, :other, :notes, :reminders, :three_things_i_am_grateful_for, :negative_thoughts, :challenges, :breakfast, :snack_one, :lunch, :snack_two, :dinner, :healthy, :how_did_i_feel_after, :time_eaten, :brain_health, :physical_health, :emotional_health, :thinking_patterns, :spouse, :children, :family_and_friends, :work, :school, :money, :spiritual_life, :character, :passions, :community_service, :giving_to_charity, :word_of_day, :bible_verse_of_day, :user_id)
    end


end