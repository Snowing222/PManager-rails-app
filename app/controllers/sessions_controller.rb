class SessionsController < ApplicationController
    before_action :redirect_logged_in_user_to_homepage, only: [:new]
    
    def create
        if auth
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to products_path

        else
            @user = User.find_by(email: params[:email])
     
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to products_path
            elsif !@user 
                flash[:error] = "Username doesnt exist. Please Sign Up"
                redirect_to new_user_path
            else
                flash[:error]= "Password is incorrect. Please try again"
                render 'new'
            end
        end
        
    end

    def destroy
        reset_session
        redirect_to login_path
    end

    private

    def auth
        request.env['omniauth.auth'] 
    end
end
