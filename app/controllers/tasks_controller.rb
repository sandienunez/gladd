class TasksController < ApplicationController

    def new
        # binding.pry
        @task = Task.new
    end 

    def index 
        @tasks = Task.priority_order
    end

    def create
        # binding.pry
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else 
            render :new
        end 
    end 
        
    def show 
        # binding.pry
        set_task
        @comment = Comment.find_by_id(params[:id])
        # @comment = @task.comments
    end

    def edit
        set_task
    end

    def update
        set_task
        if @task.update(task_params) && current_user.id == @task.user_id  #if return value doesnt save = returns false
            redirect_to task_path(@task)
        else 
          redirect_to edit_task_path
        end
    end

    def destroy
        set_task
        if @task.destroy && current_user.id == @task.user_id  #if return value doesnt save = returns false
            redirect_to tasks_path 
        end
    end

    private
    #strong params = needed when you are mass assigning data 

    def set_task #lets you pull id, not repeat yourself in your controllers
        @task = Task.find_by_id(params[:id])
        if ! @task 
            redirect_to tasks_path 
        end 
    end

    def task_params
        # binding.pry
        params.require(:task).permit(:date, :"date(2i)", :priority_ranking, :task_name, :action_one, :action_two, :action_three, :deadline, :estimate_time_to_finish_task, :user_id)
    end

    #add destroy for delete button link_to

end 
