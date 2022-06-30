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
          format.html { redirect_to entry_url(@blog), notice: "Entry was successfully created." }
          format.json { render :show, status: :created, location: @blog }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end

end

def show 
    @blog = Blog.find(params["id"])
    
end


def blog_params
    params.require(:blog).permit(:author, :body, :title, :excerpt)
  end




end


