class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

layout :layout_by_resource

  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "admin"
    end
  end
  
end
