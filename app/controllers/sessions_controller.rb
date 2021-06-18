class SessionsController < ApplicationController
    def create
        username = params[:user][:username]
        password = params[:user][:password]
        @current_user = Library.where(:username => username)
        if @current_user.length==0 then 
            redirect_to login_path
        else
            if Library.where(:password => password).length==0 then 
                redirect_to login_path
            else 
                session[:user] = @current_user[0][:username]
                redirect_to root_path
            end
        end
    end
end
