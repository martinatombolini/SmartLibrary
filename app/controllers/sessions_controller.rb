class SessionsController < ApplicationController
    def create
        username = params[:user][:username]
        password = params[:user][:password]
        @current_user = Library.where(:username => username)
        if @current_user.length==0 or @current_user[0][:password]!= password then 
            flash[:loginerror]=true
            redirect_to login_path
            else
                session[:user]=@current_user[0][:username]
                redirect_to books_path
            end
    end

    def destroy
        session.delete(:user)
        redirect_to login_path
    end
end