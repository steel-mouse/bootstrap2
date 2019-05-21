class BlogsController < ApplicationController

  before_action :set_blog, only: [ :edit, :update, :destroy]


  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
     @blog = Blog.new
    end
  end

  def create
   @blog = Blog.new(blog_params)
   @blog.user_id = current_user.id
   if @blog.save
     redirect_to new_blog_path,notice:"ブログを作成しました。"
   else
     render'new'
   end
  end

  def edit
    set_blog
  end

  def update
    set_blog
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  def show
    set_blog
  end

def top

end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
