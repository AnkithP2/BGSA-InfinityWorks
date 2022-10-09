module ApplicationHelper

    def logged_in?
        !!session[:admin_id]
    end

    def current_admin
        @current_admin ||= admin.find_by_id(session[:admin_id]) if !!session[:admin_id]
    end
    
end
