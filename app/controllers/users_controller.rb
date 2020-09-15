class UsersController < ApplicationController
    before_action :authenticate_user!

    #GET /register - New User Action 
    def new #actions 
        @user = User.new

    end

    #POST /users - Create User Action 
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            #log them in 
            redirect_to user_path(@user)
            #redirect to show page 
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        #render show.html.erb page if user succefully login?
        redirect_to '/' if !@user 
    end

    private 

    def user_params
        params.require(:user).permit(:full_name, :email, :password)
        #require our object 
    end




end