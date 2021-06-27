class SearchesController < ApplicationController
    def index 
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return  
        else 
            @parameter = params[:search].downcase  
            @results = Book.all.where("lower(title) LIKE :search", search: @parameter) 
            render 'index'
        end  
    end
end
