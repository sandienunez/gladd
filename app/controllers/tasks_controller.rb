class TasksController < ActionController::Base

    def new
        @task = Task.new
    end 

    def index 
        @tasks = Task.priority_order
        # @tasks = Task.all 
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else 
            render :new
        end 
    end 
        
    

    def show 
        @task = Task.find_by_id(params[:id])
    end

    def edit
        @task = Task.find_by_id(params[:id])
    end

    def update
        @task = Task.find_by_id(params[:id])

        if @task.update(task_params)
            redirect_to task_path(@task)
        end
    end

    private
    #strong params = needed when you are mass assigning data 

    def task_params
        params.require(:task).permit(:task_name, :prayer, :exercise, :supplements, :daily_plan, :stretch, :diet, :user_id)
    end

    #add destroy for delete button link_to

end 
