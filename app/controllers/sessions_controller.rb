class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by(email: params[:email])
     
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        elsif !@user 
            flash[:error] = "Username doesnt exist. Please Sign Up"
            redirect_to new_user_path
        else
            flash[:error]= "Password is incorrect. Please try again"
            render 'new'
        end

    end

    def destroy
        reset_session
        redirect_to '/'
    end
end
