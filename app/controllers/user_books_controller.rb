class UserBooksController < ApplicationController
    def index
        render json: UserBook.all
    end

    def create
        user_book = current_user.user_books.create(user_book_params)
        if user_book.valid?
            render json: user_book, status: :created
        else
            render json: user_book.errors, status: :unprocessable_entity
        end
    end

    private

    def user_book_params
        params.permit(:book_id)
    end
  
end
