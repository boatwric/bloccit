Rails.application.routes.draw do

  #GOT RID OF IN CHECKPOINT 21-resources :topics #didn't pass in any action arguments into controller generator; resources creates seven standard CRUD routes for me (index, create, new, edit, show, update PUT, update PATCH, destroy)
  #GOT RID OF IN CHECKPOINT 21-resources :posts #call the resources method and pass it a symbol; instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post

  resources :topics do
    #pass resources :posts to the resources :topics block. This nests the post routes under the topic routes
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about' #remove get "welcome/index" because we've declared the index view as the root view; also modify the about route to allow users to visit /about, rather than /welcome/about

  root 'welcome#index'#root method allows us to declare the default page; index will be the first thing we see

end

#TO GET ALL ROUTES IN TERMINAL...
  ##rails routes
