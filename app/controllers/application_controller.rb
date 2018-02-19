class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #SessionsController has no way of finding create_session; need to include SessionsHelper either directly in  SessionsController, or here in ApplicationController
  include SessionsHelper
end
