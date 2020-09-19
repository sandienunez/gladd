class DailyRoutinesController < ApplicationController
    def new
        if user_signed_in?
            @daily_routine = DailyRoutine.new  
        else 
            redirect_to '/'
        end 
    end

    def create
        if user_signed_in?
            @daily_routine = current_user.daily_routines.build(daily_routine_params)
                if @daily_routine.save
                    redirect_to daily_routines_path
                else
                    render :new
                end
        else 
            redirect_to '/'
        end 
    end

    def edit 
        if user_signed_in?
            set_daily_routine
        else 
            redirect_to '/'
        end 
    end

    def show
        if user_signed_in?
            set_daily_routine
        else 
            redirect_to '/'
        end 
    end

    def index 
        if user_signed_in?
            @daily_routines = DailyRoutine.all
        else 
            redirect_to '/'
        end 
    end

    def update
        if user_signed_in?
            set_daily_routine
                if  @daily_routine.update(daily_routine_params) && current_user.id == @daily_routine.user_id 
                    redirect_to daily_routines_path(@daily_routine)
                end 
        else 
            redirect_to '/'
        end 
    end

    def destroy
        if user_signed_in?
            set_daily_routine
                if current_user.id == @daily_routine.user_id
                    @daily_routine.destroy
                end
            redirect_to daily_routines_path
        else 
            redirect_to '/'
        end 
    end

    private

    def set_daily_routine
        @daily_routine = DailyRoutine.find_by_id(params[:id])
        if !@daily_routine || @daily_routine.user != current_user
                redirect_to daily_routines_path
            end
    end

    def daily_routine_params
        params.require(:daily_routine).permit(:date, :"date(2i)", :daily_plan, :prayer_or_meditations, :exercise_plan, :stretch_plan, :three_superfoods_to_add_to_my_meals, :user_id)
    end


end