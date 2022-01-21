class TopController < ApplicationController
    def index
        @page_title = "Top Controller"
        cookies.delete(:admin_id)
    end 
end  