class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def remote_ip
    if request.remote_ip == "127.0.0.1"
      '68.175.68.243'
    else
      request.remote_ip
    end
  end
end
