require 'rails_helper.rb'
describe ReservationsController, type: :controller do
    fixtures :all
    before(:all) do 
    Reservation.all.each do |bk|
        bk.destroy
    end
    end

    
end