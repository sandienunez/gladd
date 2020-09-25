class CommentsController <  ApplicationController
before_action :authenticate_user!
    def new
        # binding.pry
        #if task_id come thru
        #added new feature that lets user be on the correct comment when in the nested route! = better user experience
            if params[:task_id]
                # binding.pry
                @task = Task.find_by(id: params[:task_id])
                @comment = @task.comments.build 
            else
                @comment = Comment.new
            end 
    end

    def create
        @comment = current_user.comments.build(comment_params)
            if @comment.save
                redirect_to comments_path
            else
                render :new
            end
    end

    def edit 
        set_comment 
 
    end

    def show
        set_comment
    end

    def index 
        if params[:task_id] && @task = Task.find_by_id(params[:task_id])
            @comments = @task.comments
        else
            @comments = Comment.all
        end
    end

    def update
        set_comment
            if current_user.id == @comment.user_id 
                @comment.update(comment_params)
            end   
            redirect_to comments_path 
    end

    def destroy
        set_comment
            if current_user.id == @comment.user_id
                @comment.destroy
            end
        redirect_to comments_path 
    end

    private

    def set_comment
        @comment = Comment.find_by(id: params[:id])
            if !@comment || @comment.user != current_user
                redirect_to comments_path, notice: "Sorry! Tasky penguin says you're not authorized to view this comment! So flap your wings out of here!"    
            end
    end

    def comment_params
        params.require(:comment).permit(:message, :task_id, :task_name, :user_id)
    end
end