class UsersController < ApplicationController

    def index
      @book = Book.new
      @users = User.all
      @user = current_user

    end

    def show
      @user = User.find(params[:id])
      @book = Book.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])

    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to book_path(@user.id)
      else
        render :edit
      end
    end

    private
  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end

end
