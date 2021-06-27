class Book < ApplicationRecord
    has_many :reservations
    validates :title, presence: true
    validates :notes, presence: true
    validates :author, presence: true
    validates :isbn, presence: true, length: { is: 13 }, numericality: { only_integer: true }

end
