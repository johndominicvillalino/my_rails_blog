class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]

def index 
    @blogs = Blog.all
end

def new
    @blog = Blog.new
end

def show 
end

def edit
end



def create
    @blog = Blog.new(blog_params)

    respond_to do |format|

        if @blog.save
          format.html { redirect_to blogs_path, notice: "Blog was successfully created." }
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

def destroy 
  @blog.destroy
  respond_to do |format|
    format.html {redirect_to blogs_url, notice: "Blog was deleted"}
  end
  end

def set_blog
  @blog = Blog.find(params["id"])
end



def update
  respond_to do |format|
    if @blog.update(blog_params)
      format.html { redirect_to blog_url(@blog), notice: "Friend was successfully updated." }
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end
end

private
def set_blog
  @blog = Blog.find(params[:id])
end

def blog_params
  params.require(:blog).permit(:author, :title, :body, :excerpt)
end





end


