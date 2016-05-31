class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_book, only: [:edit, :update, :destroy]
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to my_book_path(@book), notice: "Book created!"
    else
      flash.now[:alert] = "Book not created!"
      render :new
    end
  end

  def show
    @memo = Memo.new
    respond_to do |format|
      format.html { render }
    end
  end

  def index
    @books = Book.all
    respond_to do |format|
      format.html { render }
    end
  end

  def edit
  end

  def update
    if @book.update book_params
      redirect_to book_path(@book), notice: "Book updated!"
    else
      flash.now[:alert] = "Book not updated!"
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book deleted!"
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher,
                                 :published_date, :number_of_pages,
                                 :category_id, :language_id, :image)
  end

  def find_book
    @book = Book.find params[:id]
  end

  def authorize_book
    redirect_to root_path unless can? :crud, @book
  end
end
