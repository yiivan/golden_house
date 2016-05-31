class My::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
  end

  # def create
  #   @book = Book.new book_params
  #   @book.users = current_user
  #   if @book.save
  #     redirect_to my_book_path(@book), notice: "Book created!"
  #   else
  #     flash.now[:alert] = "Book not created!"
  #     render :new
  #   end
  # end

  def show
    @memo = current_user.memos.new
    respond_to do |format|
      format.html { render }
    end
  end

  def index
    @books = current_user.books.all.uniq
    respond_to do |format|
      format.html { render }
    end
  end

  private

  def find_book
    @book = Book.find params[:id]
  end
end
