class ReservationsController < ApplicationController
  def new
  end

  def create
    authorize! :create, Reservation, message: "You are not authorized!"
    id_book = params[:book_id]
    user_id = current_user.id
    @book = Book.find(id_book)
    @reservation = @book.reservations.create!(:comments =>
    params[:reservation][:comments],:user_id=> user_id, :confirmed => 0)
      
    redirect_to @current_user
      
  end

  def destroy
    authorize! :destroy, Reservation, message: "You are not authorized!"
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to current_user
  end

  def is_confirmed
    @reservation= Reservation.find(params[:id])
    @reservation.update(confirmed: 1)
    redirect_to current_user
  end

  def is_deleted
    @reservation= Reservation.find(params[:id])
    @reservation.update(confirmed: 2)
    redirect_to current_user
  end
end