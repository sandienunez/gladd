class CallbacksController < Devise::OmniauthCallbacksController 


    def github

        @user = User.from_omniauth(request.env["omniauth.auth"])

        sign_in_and_redirect @user 
    end
end

    #customizing exisiting controllers given to you by omniauth
