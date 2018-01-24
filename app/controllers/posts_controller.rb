class PostsController < ApplicationController
  def index
    @posts = Post.all #declare an instance variable @posts and assign it a collection of Post objects using the `all` method provided by ActiveRecord; `all` returns a collection of Post objects
    @posts.map.with_index { |post, index| post.title.replace "SPAM" if (index == 0 || index % 5 == 0) }
  end

  def show
  end

  def new
  end

  def edit
  end
end
