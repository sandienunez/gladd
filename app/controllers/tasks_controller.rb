class TasksController < ActionController::Base

    def new
        @task = Task.new
        @daily_checkin = @daily_checkin.daily_checkins.build
    end 

    def index 
        @tasks = Task.priority_order
        # @tasks = Task.all 
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
        binding.pry
        set_task
        @daily_checkin = Daily_checkin.find(params[:daily_checkin_id])
    end

    def edit
        set_task
    end

    def update
        set_task

        if @task.update(task_params)
            redirect_to task_path(@task)
        end
    end

    def destroy
        set_task
        if current_user.id == @task.user_id 
            @task.destroy 
        end
            redirect_to tasks_path 
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
        params.require(:task).permit(:date, :"date(2i)", :priority_ranking, :task_name, :prayer, :exercise, :supplements, :daily_plan, :stretch, :diet, :user_id)
    end

    #add destroy for delete button link_to

end 
