Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  root 'welcome#index'#root method allows us to declare the default page; index will be the first thing we see

end
