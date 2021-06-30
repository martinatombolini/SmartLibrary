class HomepageController < ApplicationController
    def index
        @pagy, @books = pagy(Book, items: 3)
    end
end
