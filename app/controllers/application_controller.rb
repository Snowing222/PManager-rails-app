class ApplicationController < ActionController::Base
    def current_user
        @current_user||=User.find(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    private
 
    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end
