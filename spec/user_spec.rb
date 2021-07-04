require 'rails_helper'

RSpec.describe User, type: :model do

    describe "Create a User with an invalid email" do
        it "shouldn't be permitted" do
          user = User.create(email: 'test',
                       password: 'Prova1234',
                       password_confirmation: 'Prova1234')
          expect(user).to_not be_valid
        end
    end

    describe "Create a User without an email" do
        it "shouldn't be permitted" do
          user = User.create(password: 'Prova1234',
                             password_confirmation: 'Prova1234')
          expect(user).to_not be_valid
        end
    end

    describe "Create a User without a password" do
        it "shouldn't be permitted" do
          user = User.create(email: 'test@test.com', password_confirmation: 'Prova1234')
          expect(user).to_not be_valid
        end
    end

    describe "Create a User with password and password_confirmation with different values " do
        it "shouldn't be permitted" do
          user = User.create(email: 'test@test.com', password: 'prova', password_confirmation: 'Prova1234')
          expect(user).to_not be_valid
        end
    end

    describe "Create a User with a password shorter than 6 characters" do
        it "shouldn't be permitted" do
          user = User.create(email: 'test@test.com', password: 'prova', password_confirmation: 'prova')
          expect(user).to_not be_valid
        end
    end

    describe "Create a User with a valid email and password" do
        it "should be permitted" do
          user = User.create(email: 'test@test.com', password: 'Prova1234',  password_confirmation: 'Prova1234')
          expect(user).to be_valid
        end
    end
end