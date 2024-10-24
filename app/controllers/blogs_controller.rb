class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blogs = Blog.all
    @blog = Blog.find(params[:id])
  end
end
