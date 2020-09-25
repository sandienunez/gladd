class DailyRoutinesController < ApplicationController
    before_action :authenticate_user!
       
    def new
        @daily_routine = DailyRoutine.new  
    end

    def create
        @daily_routine = current_user.daily_routines.build(daily_routine_params)
            if @daily_routine.save
                    redirect_to daily_routines_path
                else
                    render :new
                end
    end

    def edit 
        set_daily_routine
    end

    def show
            set_daily_routine
    end

    def index 
        @daily_routines = DailyRoutine.all
    end

    def update
        set_daily_routine
            if  @daily_routine.update(daily_routine_params) && current_user.id == @daily_routine.user_id 
                redirect_to daily_routines_path(@daily_routine)
            end 
    end

    def destroy
        set_daily_routine
            if current_user.id == @daily_routine.user_id
                @daily_routine.destroy
            end
        redirect_to daily_routines_path
    end

    private

    def set_daily_routine
        @daily_routine = DailyRoutine.find_by_id(params[:id])
        if !@daily_routine || @daily_routine.user != current_user
                redirect_to daily_routines_path, notice: "Sorry! Tasky penguin says you're not authorized to view this Daily Routine! So flap your wings out of here!"
            end
    end


    def daily_routine_params
        params.require(:daily_routine).permit(:date, :"date(2i)", :daily_plan, :prayer_or_meditations, :exercise_plan, :stretch_plan, :three_superfoods_to_add_to_my_meals, :user_id)
    end


end