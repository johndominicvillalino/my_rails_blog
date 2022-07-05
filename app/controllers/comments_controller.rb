class CommentsController < ApplicationController

    before_action :get_blog

    def index 
       
        @comments = @blog.comments
      
    end

    def new
    @comment = @blog.comments.build => single_resource
    end

    def create
        @comment = @blog.comments.build(comment_params)

        respond_to do |format|

        if(@comment.save)
            format.html { redirect_to blog_comments_path, notice: "Comment was successfully created." }
        else
            format.html { render :new, status: :unprocessable_entity }
        end
    end
    end

    private
    def get_blog
        @blog = Blog.find(params[:blog_id])
    end


    def comment_params
        params.require(:comment).permit(:body, :blog_id)
    end





end
