class CopiesController < ApplicationController
  def index
    @book = Book.find(params[:id])
    @copies = Copy.find_by_book_id(@book.id)
  end

  def show; end

  def new
    @copy = Copy.new
    # @book = Book.find(params[:id])
    # @copies.instance_variable_set(:book, @book.id)
  end

  def create
    @copy = Copy.new(copy_params)

    if @copy.save
      redirect_to action: 'index'
    else
      puts 'Did not create'
      render action: 'new'
    end
  end

  def copy_params
    params.require(:copy).permit(:borrower, :due_date, :book)
  end

  def edit
    @copy = Copy.find(params[:id])
  end

  def update
    @copy = Copy.find(params[:id])

    if @copy.update_attributes(copy_params)
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end

  # I was expecting to call this 'delete' since that is what 'method' calls
  # Why is it destroy instead? Is there any way I could have guessed that?
  def destroy
    Book.find(params[:id]).destroy
    redirect_to action: 'list'
  end
end
