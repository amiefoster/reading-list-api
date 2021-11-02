class Book < ApplicationRecord
    has_many :user_books
    has_many :readers, through: :user_books, source: :user

    validates :title, uniqueness: { scope: [:author] }
    validates :author, :title, :description, presence: true
end


