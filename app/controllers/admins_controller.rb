class AdminsController < ApplicationController
    def admin_login
        cookies.delete(:member_id)
    end
    def show
        if current_admin
            @admin = current_admin
        else
            redirect_to :admin_login_admin
        end
    end
end