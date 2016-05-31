class My::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = Favorite.new
    favorite.user = current_user
    favorite.book = book
    if favorite.save
      redirect_to my_book_path(book), notice: "Added this book to favorite!"
    else
      redirect_to my_book_path(book), alert: "You'va already make this into your favorite!"
    end
  end

  def index
  end

  def destroy
    favorite = Favorite.find params[:id]
    favorite.destroy
    redirect_to my_book_path(favorite.book_id), notice: "Un-favorite!"
  end

  private

  def book
    @book ||= Book.find params[:book_id]
  end

  def favorite
    @favorite ||= Favorite.find params[:id]
  end
end
