class UsersController < ApplicationController
    def new
        @user = User.new
        @user.company = Company.last
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to edit_user_path(@user)
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update

        @user = User.find(params[:id])
     
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        @user = User.find_by(id: session[:user_id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :role, :company_id)
    end
end
