require 'rails_helper'

RSpec.describe Reservation, type: :model do
    describe "Associations" do
        it "belongs to book" do
            assc = described_class.reflect_on_association(:book)
            expect(assc.macro).to eq :belongs_to
        end

        it "belongs to user" do
            assc = described_class.reflect_on_association(:user)
            expect(assc.macro).to eq :belongs_to
        end
    end
end