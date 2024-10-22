class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blogs = Blog.find(params[:id])
  end
end
