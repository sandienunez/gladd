class ApplicationController < ActionController::Base
    
    # helper_method :current_user, :logged_in?
    # #gives access to methods in the views 

    # private
    #     def current_user
    #         @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    #     end

    #     def loggin_in?
    #         !!session[:user_id]
    #     end

    #     def redirect_of_not_logged_in 
    #         redirect_to '/' if !loggged_in?
    #     end


end
