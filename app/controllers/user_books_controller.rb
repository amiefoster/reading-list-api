class UserBooksController < ApplicationController
    ### GET /user_books
    def index
        render json: UserBook.all
    end

    ### POST /user_books
    def create
        user_book = current_user.user_books.create(create_user_book_params)
        if user_book.valid?
            render json: user_book, status: :created
        else
            render json: { errors: user_book.errors }, status: :unprocessable_entity
        end
    end

    ### PATCH /user_books/:id
    def update
        user_book = Userbook.find(params[:id])
        if user_book.update(update_user_book_params)
            render json: user_book, status: :ok
        else
            render json: { errors: user_book.errors }, status: :unprocessable_entity
        end
    end

    ### DELETE  /user_books/:id
    def destroy
        user_book = current_user.user_books.find(params[:id])
        user_book.destroy
        head :no_content
    end


    private

    ### params for create method
    def create_user_book_params
        params.permit(:book_id)
    end

    ### params for update method
    def update_user_book_params
        params.permit(:read)
    end
  
end
