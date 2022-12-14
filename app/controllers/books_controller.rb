class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user


  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user.id == current_user.id
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to book_path(@book.id)
      else
        render :edit
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
