class UsersController < ApplicationController
    def show
        @user= User.find(params[:id])
        @book=Book.all
        @reservation=Reservation.all
    end

    def edit

    end
end