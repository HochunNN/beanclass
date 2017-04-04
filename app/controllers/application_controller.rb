class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  before_filter :foo_function

  def foo_function
    @linetalks = Linetalk.order("id desc").paginate(:page => params[:page], :per_page => 10)
  end

  
  
end
