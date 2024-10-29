class UsersController < ApplicationController
    def show 
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        unless @user.id == current_user.id
            redirect_to posts_path
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(user_params)
        else 
            render :edit
        end
    end

    def user_params
        params.require(:user).permit(:username)
    end
end
