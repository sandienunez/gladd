class TasksController < ApplicationController

    def new
        if user_signed_in? 
            @task = Task.new
            render :new
        else 
           redirect_to '/'
        end 
    end 

    def index 
        if user_signed_in?
            @tasks = Task.priority_order
        else 
            redirect_to '/'
         end 
    end

    def create
        if user_signed_in?
            @task = Task.new(task_params)
                if @task.save
                    redirect_to task_path(@task)
                else 
                    render :new
                end 
        else 
            redirect_to '/'
        end 
    end 
        
    def show 
        if user_signed_in?
            set_task
            @comment = Comment.find_by_id(params[:id])
        else 
            redirect_to '/'
        end 
    end

    def edit
        if user_signed_in?
            set_task
                if !@task || @task.user != current_user 
                    redirect_to tasks_path, notice: "Sorry! Tasky penguin says you're not authorized to edit this task! So flap your wings out of here!"
                end 
        else 
            redirect_to '/'
        end 
    end

    def update
        if user_signed_in?
            set_task
                if @task.update(task_params) && current_user.id == @task.user_id  #if return value doesnt save = returns false
                    redirect_to task_path(@task)
                else 
                    render :new
                end
        else 
            redirect_to '/'
        end 
    end

    def destroy
        if user_signed_in?
            set_task
            if @task.destroy && current_user.id == @task.user_id  #if return value doesnt save = returns false
                redirect_to tasks_path 
            end
        else 
            redirect_to '/'
        end 
    end

    private

    def set_task #lets you pull id, not repeat yourself in your controllers
        @task = Task.find_by_id(params[:id])
            if !@task 
                redirect_to tasks_path
            end 
    end

    def task_params
        params.require(:task).permit(:date, :"date(2i)", :priority_ranking, :task_name, :action_one, :action_two, :action_three, :deadline, :estimate_time_to_finish_task, :user_id)
    end

    #strong params = needed when you are mass assigning data 


end 
