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
      redirect_to :action => 'index'
    else
      @subjects = Subject.all
      render :action => 'new'
    end
  end

  def book_params
    params.require(:books).permit(:title, :author, :isbn)
  end
end
