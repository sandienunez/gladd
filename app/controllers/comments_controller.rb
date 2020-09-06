class CommentsController <  ApplicationController
    def new
        @comment = Comment.new  
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          redirect_to new_comment_path
        else
          render :new
        end
    end

    def edit 
     @comment = Comment.find_by_id(params[:id])
    end

    def show
        @comment = Comment.find_by_id(params[:id])
        redirect_to comment_path(@comment)
    end

    def index 
        if @comment = Comment.find_by_id(params[:id])
             @comments = Comment.all 
        else
            redirect_to comments_path
        end
    end

    def update
        @comment = Comment.find_by_id(params[:id])
        if @comment.update(comment_params)
            redirect_to comments_path(@comment)
        end
    end

    def comment_params
        params.require(:comment).permit(:message, :task_id)
    end
end