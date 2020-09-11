class CopiesController < ApplicationController
  before_action :find_book

  def find_book
    if params[:book_id].blank?
      @copy = Copy.find(params[:id])
      @book = Book.find(@copy.book_id)
    else
      @book = Book.find(params[:book_id])
    end
  end

  def index
    @copies = @book.copies
  end

  def new
    @copy = @book.copies.new
  end

  def create
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

  def edit; end

  def update

    if @copy.update_attributes(copy_params)
      redirect_to book_copies_path(@book)
    else
      render action: 'edit'
    end
  end

  def destroy
    Copy.find(params[:id]).destroy
    redirect_to action: book_copies_path(@book)
  end
end
