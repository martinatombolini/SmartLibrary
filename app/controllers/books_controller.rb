class BooksController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def index
        @books = Book.all
    end

    def search 
        @books = Book.where("title LIKE?", "%" + params[:q] + "%")
    end

    def show
        @book = Book.find(params[:id])
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
 
        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end

    def update
        authorize! :destroy, Book, message: "You are not authorized"
        @book = Book.find(params[:id])
       
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
       
        redirect_to books_path
    end

    private
        def book_params
            params.require(:book).permit(:title, :author, :notes, :isbn)
        end
end
