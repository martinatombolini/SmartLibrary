class ReservationsController < ApplicationController
  def new
  end

  def create
    id_book = params[:book_id]
    user_id = current_user.id
    @book = Book.find(id_book)
    @reservation = @book.reservations.create!(:comments =>
    params[:reservation][:comments],:user_id=> user_id, :confirmed => 0)
      
    redirect_to books_path
      
  end

  def destroy
  end
end
