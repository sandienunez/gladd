class RegistrationsController < Devise::RegistrationsController

        private
        
        def sign_up_params
            params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
        end
        
        def account_update_params
            params.require(:user).permit(:full_name, :last_name, :email, :password, :password_confirmation)
        end
    
    
end
