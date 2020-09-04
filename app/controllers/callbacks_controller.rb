class CallbacksController < Devise::OmniauthCallbacksController 
    #customizing exisiting controllers given to your by omniauth
    def github
        binding.pry 

        @user = User.from_omniauth(request.env["omniauth.auth"])

        sign_in_and_redirect @user 
    end
end