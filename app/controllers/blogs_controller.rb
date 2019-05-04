class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
   @blog = Blog.new(blog_params)
   if @blog.save
     redirect_to new_blog_path,notice:"ブログを作成しました。"
   else
     render'new'
   end
  end

  def edit
    
  end




  private

  def blog_params
    params.require(:blog).permit(:content)
  end
end
