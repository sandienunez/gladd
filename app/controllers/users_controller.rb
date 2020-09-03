class UsersController < ApplicationController

    #GET /register - New User Action 
    def new #actions 
        @user = User.new

    end

    #POST /users - Create User Action 
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        
    end

    private 

    def user_params
        params.require(:user).permit(:email, :password)
        #require our object 
    end


end