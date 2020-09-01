class TaskController < ActionController::Base

    def new

    end 

    def index 
        @tasks = Task.all 
    end

    def create
        @task = Task.new
        @task.goal = params["Goal"]
    end

    private
    #strong params = needed when you are mass assigning data 

    def task_params

    end

end 
