class BooksController < ApplicationController
  
    ### GET /books
    def index
      render json: Book.all
    end
  
    ### GET /books/:id
    def show
      render json: Book.find(params[:id]), include: [:readers]
    end

    ### POST /books
    def create
        book = Book.create(book_params)
        if book.valid?
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
    end

    private

    ### params for create method
    def book_params
      params.permit(:title, :author, :description, :cover_image_url)
    end
  
  
  end

  