require 'rails_helper'

RSpec.describe Book, type: :model do

    describe "Create a Book without a title" do
        it "shouldn't be permitted" do
          book = Book.create(notes: 'MyText',
                       author: 'Author',
                       isbn: '1234567890123')
          expect(book).to_not be_valid
        end
    end

    describe "Create a Book without notes" do
        it "shouldn't be permitted" do
          book = Book.create(title: 'title',
                       author: 'Author',
                       isbn: '1234567890123')
          expect(book).to_not be_valid
        end
    end

    describe "Create a Book without a author" do
        it "shouldn't be permitted" do
          book = Book.create(title: 'title',
                       notes: 'MyText',
                       isbn: '1234567890123')
          expect(book).to_not be_valid
        end
    end

    describe "Create a Book without a isbn" do
        it "shouldn't be permitted" do
          book = Book.create(title: 'title',
                       notes: 'MyText',
                       author: 'Author')
          expect(book).to_not be_valid
        end
    end

    describe "Create a Book with a isbn without only integers" do
        it "shouldn't be permitted" do
          book = Book.create(title: 'title',
                       notes: 'MyText',
                       author: 'Author',
                       isbn: 'abcdefghilmno')
          expect(book).to_not be_valid
        end
    end

    describe "Create a Book with a isbn shorter than 13 numbers" do
        it "shouldn't be permitted" do
          book = Book.create(title: 'title',
                       notes: 'MyText',
                       author: 'Author',
                       isbn: '1234')
          expect(book).to_not be_valid
        end
    end

    describe "Associations" do
        it "has many reservations" do
            assc = described_class.reflect_on_association(:reservations)
            expect(assc.macro).to eq :has_many
        end
    end



end