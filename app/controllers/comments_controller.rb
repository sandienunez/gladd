class CommentsController <  ApplicationController
    def new
        @comment = Comment.new  
    end

    def create
        # @comment = Comment.new(comment_params) #which works better build or new here?
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
        if @comment.update(comment_params)
            redirect_to comments_path(@comment)
        end
    end

    def destroy
        @comment = Comment.find_by_id(params[:id])
        if current_user.id == @comment.user_id
            @comment.destroy
        else
            redirect_to comments_path 
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:message, :task_id)
    end
end