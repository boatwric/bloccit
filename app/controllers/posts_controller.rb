#DEFINES THE ACTIONS OF POSTS

class PostsController < ApplicationController

  #Got rid of index method once topic logic was in place

  def show
    @post = Post.find(params[:id]) #find the post that corresponds to the id in the params that was passed to show and assign it to @post. Unlike in the index method, in the show method, we populate an instance variable with a single post, rather than a collection of posts
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new #create an instance variable, @post, then assign it an empty post returned by Post.new
  end

  def create #no view for create, works behind scenes- POST method
        #call Post.new to create new instance of Post
        @post = Post.new 
        @post.title = params[:post][:title]
        @post.body = params[:post][:body]
        #define topic
        @topic = Topic.find(params[:topic_id])
        #assign topic to post
        @post.topic = @topic
   
        if @post.save #if post successfully saved to DB, show a success method using flash[:notice] and redirect user to route generated by @post- will take user into show view
          flash[:notice] = "Post was saved."
          #redirects to nested topic/post path
          redirect_to [@topic, @post]
        else 
          #if save doesn't work, flash error message and render the new view again
          flash.now[:alert] = "There was an error saving the post. Please try again."
          render :new
        end
  end

  def edit
    @post = Post.find(params[:id]) #find the edit method by the post's id, then perform whatever logic
  end

  def update
    @post = Post.find(params[:id]) #find post id and assign to @post
    @post.title = params[:post][:title] #pass title to @post
    @post.body = params[:post][:body] #pass body to @post

    if @post.save 
      #if @post is saved, flash saved notice and redirect to @post
      flash[:notice] = "Post was updated."
      #redirects to nested topic/post path
      redirect_to [@post.topic, @post]
    else 
      #if @post doesn't save, flash an alert and go back to the edit view
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  
  end

  def destroy
    
    @post = Post.find(params[:id]) #find @post by the post's id

    if @post.destroy #destroy is like the opposite of generate; don't have to enter in the title and body, just find the id and Rails will do the rest
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      #when post is deleted, redirect to topic show view
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show #goes back to showing individual post
    end
  end

end
