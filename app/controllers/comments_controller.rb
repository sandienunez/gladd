class CommentsController <  ApplicationController
    # before_action :security_check

    def new
        if user_signed_in?
            @comment = Comment.new  
        else 
            redirect_to '/'
         end 
    end

    def create
        if user_signed_in?
            @comment = current_user.comments.build(comment_params)
                if @comment.save
                    redirect_to comments_path
                else
                    render :new
                end
        else 
            redirect_to '/'
        end 
    end

    def edit 
        if user_signed_in?
            set_comment 
        else 
            redirect_to '/'
        end 
    end

    def show
        if user_signed_in?
            set_comment
        else 
            redirect_to '/'
        end 
    end

    def index 
        if user_signed_in?
            if params[:task_id] && @task = Task.find_by_id(params[:task_id])
                @comments = @task.comments
            else
                @comments = Comment.all
            end
        else 
            redirect_to '/'
        end 
    end

    def update
        if user_signed_in?
            set_comment
                if current_user.id == @comment.user_id 
                    @comment.update(comment_params)
                end 
               
            redirect_to comments_path 
        else 
            redirect_to '/'
        end 
    end

    def destroy
        if user_signed_in?
            set_comment
                if current_user.id == @comment.user_id
                    @comment.destroy
                end
            redirect_to comments_path 
        else 
            redirect_to '/'
        end 
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