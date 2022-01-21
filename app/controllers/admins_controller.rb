class AdminsController < ApplicationController
    def admin_login
        cookies.delete(:member_id)
    end
    def show
        if current_admin
            @admin = current_admin
        else
            render "admin_login"
        end
    end
end