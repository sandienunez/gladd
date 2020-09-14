class CommentsController <  ApplicationController
    def new
        @comment = Comment.new  
    end

    def create
        # binding.pry
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          redirect_to comments_path
        else
          render :new
        end
    end

    def edit 
     @comment = Comment.find_by_id(params[:id])
    end

    def show
        @comment = Comment.find_by_id(params[:id])
        
    end

    def index 
        if params[:task_id] && @task = Task.find_by_id(params[:task_id])
            @comments = @task.comments
         else
           @comments = Comment.all
         end
    end

    def update
        @comment = Comment.find_by_id(params[:id])
        if current_user.id == @comment.user_id 
            @comment.update(comment_params)
        end 
        redirect_to comments_path(@comment)
    end

    def destroy
        @comment = Comment.find_by_id(params[:id])
        # binding.pry
        if current_user.id == @comment.user_id
            @comment.destroy
        end
        redirect_to comments_path 
    end

    private

    def comment_params
        params.require(:comment).permit(:message, :task_id, :daily_routine_id, :journal_id)
    end
end