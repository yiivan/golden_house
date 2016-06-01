class My::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def new
    if params[:search] && (params[:search] != "")
      @books = Book.search(params[:search]).order(:title)
    else
      @books = "blank"
    end
  end

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
