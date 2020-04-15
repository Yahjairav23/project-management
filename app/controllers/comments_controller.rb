
class CommentsController < ApplicationController

    def new
        @comment = Comment.new 
    end 

    def create
        @comment = Comment.new(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to task_path(@comment.task_id)
        else
            rend :new
        end 
    end 

    private

    def comment_params 
        params.require(:comment).permit(:comment, :task_id, :user_id)

    end 

end 