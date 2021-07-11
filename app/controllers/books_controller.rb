class BooksController < ApplicationController

    before_action :authenticate_user!, except: [:index,:search]
    before_action :check_owner, only: [:edit, :destroy, :update]

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
        authorize! :update, Book, message: "You are not authorized"
        @book = Book.find(params[:id])
        @book.owner=current_user.id
       
        if @book.update(book_params)
          redirect_to @book
        else
          render 'edit'
        end
    end

    def destroy
        authorize! :destroy, Reservation, message: "You are not authorized"
        @book = Book.find(params[:id])
        if Reservation.where(:book_id => @book.id).length!=0
            @book.reservations.destroy_all()
            @book.destroy
        else
            @book.destroy
        end

        redirect_to books_path
    end

    private
        def book_params
            params.require(:book).permit(:title, :author, :notes, :isbn, :owner=>current_user.id)
        end

    def check_owner
        @book = Book.find(params[:id])
        if current_user.id!=@book.owner
            redirect_to root_path
        end
    end
    
end
