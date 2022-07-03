class BlogsController < ApplicationController

def index 
    @blogs = Blog.all
end

def new
    @blog = Blog.new
end


def create
    @blog = Blog.new(blog_params)

    respond_to do |format|

        if @blog.save
          format.html { redirect_to blogs_path, notice: "Entry was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end

    
    # if@blog.save
    #   redirect_to blogs_path
    # else
    #   render:new
    # end

end

def show 
    @blog = Blog.find(params["id"])
    
end


def blog_params
    params.require(:blog).permit(:author, :body, :title, :excerpt)
  end




end


