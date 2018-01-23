Rails.application.routes.draw do

  resources :posts #call the resources method and pass it a symbol; instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post

  get 'about' => 'welcome#about'

  root 'welcome#index'#root method allows us to declare the default page; index will be the first thing we see

end
