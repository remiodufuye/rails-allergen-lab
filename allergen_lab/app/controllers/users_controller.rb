class UsersController < ApplicationController

    def index
    @user = User.all 
    end 

    def create
    user = User.create(user_strong_params)
    redirect_to user_path(user)
    end

    def edit 
        define_user
    end

    
    def update
        @user.update(user_strong_params)
        redirect_to (user_path(@user))
    end 

    def new
        @user = User.new
    end 

    def show
        define_user
    end

    def destroy
     deleted_user = define_user.destroy
     deleted_user.allergies.destroy_all
     deleted_user.recipes.destroy_all
     redirect_to users_path
    end 

    private

    def define_user
        @user = User.find(params[:id])
    end

    def user_strong_params 
        params.require(:user).permit(:name)
    end 

end
