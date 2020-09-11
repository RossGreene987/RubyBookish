class CopiesController < ApplicationController
  before_action :find_book

  def find_book; end

  def index
    @book = Book.find(params[:book_id])
    @copies = @book.copies
  end

  def new
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new
  end

  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new(copy_params)

    if @copy.save
      redirect_to action: 'index'
    else
      puts 'Did not create'
      render action: 'new'
    end
  end

  def copy_params
    params.require(:copy).permit(:borrower, :due_date)
  end

  def edit
    @copy = Copy.find(params[:id])
  end

  def update

    @copy = Copy.find(params[:id])

    if @copy.update_attributes(copy_params)
      redirect_to book_copies_path(@copy.book_id)
    else
      render action: 'edit'
    end
  end

  def destroy
    Copy.find(params[:id]).destroy
    redirect_to action: 'index'
  end
end
