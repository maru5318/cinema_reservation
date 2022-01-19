class AdminsController < ApplicationController
    def admin_login
        
    end
    def show
        @admin = Admin.find(cookies[:admin_id])
    end
end