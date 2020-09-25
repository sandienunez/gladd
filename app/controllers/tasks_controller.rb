class TasksController < ApplicationController
before_action :authenticate_user!

    def new
        @task = Task.new
        render :new
    end 

    def index 
        @tasks = Task.priority_order
    end

    def create
        @task = Task.new(task_params) #sanitize params
            if @task.save
                redirect_to task_path(@task)
            else 
                render :new
            end 
    end 
        
    def show 
        set_task
        @comment = Comment.find_by_id(params[:id])
    end

    def edit
        set_task
            if !@task || @task.user != current_user 
                redirect_to tasks_path, notice: "Sorry! Tasky penguin says you're not authorized to edit this task! So flap your wings out of here!"
            end 
    end

    def update
        set_task
            if @task.update(task_params) && current_user.id == @task.user_id  #if return value doesnt save = returns false
                redirect_to task_path(@task)
            else 
                render :new
            end
    end

    def destroy
        set_task
            if @task.destroy && current_user.id == @task.user_id  #if return value doesnt save = returns false
                redirect_to tasks_path 
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
