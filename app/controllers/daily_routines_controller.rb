class DailyRoutinesController < ApplicationController
    def new
        @daily_routine = DailyRoutine.new  
    end

    def create
        # binding.pry
        @daily_routine = current_user.daily_routines.build(daily_routine_params)
        if @daily_routine.save
          redirect_to daily_routines_path
        else
          render :new
        end
    end

    def edit 
     @daily_routine = DailyRoutine.find_by_id(params[:id])
    end

    def show
        @daily_routine = DailyRoutine.find_by_id(params[:id])
    end

    def index 
        @daily_routines = DailyRoutine.all

    end

    def update
        @daily_routine = DailyRoutine.find_by_id(params[:id])
        if  @daily_routine.update(daily_routine_params) && current_user.id == @daily_routine.user_id 
        redirect_to daily_routines_path(@daily_routine)
        end 
    end

    def destroy
        @daily_routine = DailyRoutine.find_by_id(params[:id])
        # binding.pry
        if current_user.id == @daily_routine.user_id
            @daily_routine.destroy
        end
        redirect_to daily_routines_path
    end

    private

    def daily_routine_params
        params.require(:daily_routine).permit(:date, :"date(2i)", :daily_plan, :prayer_or_meditations, :exercise_plan, :stretch_plan, :three_superfoods_to_add_to_my_meals, :emotional_scale, :tasks_completed, :went_well_tips, :bad_tips, :user_id)
    end


end