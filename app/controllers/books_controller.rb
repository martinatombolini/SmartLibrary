class BooksController < ApplicationController

    before_action :authenticate_user!, except: [:index,:search]

    def index
        @books = Book.all
    end

    def search 
        @books = Book.where("title LIKE?", "%" + params[:q] + "%")
    end

    def show
        @book = Book.find(params[:id])
        @user = User.all
        @reservation = Reservation.all
    end

    def new
        @book = Book.new
    end

    def edit
        @book = Book.find(params[:id])
    end

    def create
        authorize! :create, Book, message: "You are not authorized!"
        @book = Book.new(book_params)
        @book.owner=current_user.id
 
        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end

    def update
        authorize! :destroy, Book, message: "You are not authorized"
        @book = Book.find(params[:id])
        @book.owner=current_user.id
       
        if @book.update(book_params)
          redirect_to @book
        else
          render 'edit'
        end
    end

    def destroy
        authorize! :destroy, Book, message: "You are not authorized"
        @book = Book.find(params[:id])
        @book.destroy
       
        redirect_to current_user
    end

    private
        def book_params
            params.require(:book).permit(:title, :author, :notes, :isbn, :owner=>current_user.id)
        end
end
