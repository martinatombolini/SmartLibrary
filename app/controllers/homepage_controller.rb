class HomepageController < ApplicationController
    def index
        @books = Book.all
    end
end
