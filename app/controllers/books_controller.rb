class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_param)
      redirect_to action: 'index' #, id: @book
    else
      render action: 'edit'
    end
  end

  def book_param
    params.require(:book).permit(:title, :price, :subject_id, :description)
  end
end
