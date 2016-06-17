class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = Favorite.new
    favorite.user = current_user
    favorite.book = book
    if favorite.save
      render json: {id: favorite.id}
    else
      head :internal_server_error
    end
  end

  def destroy
    favorite = Favorite.find params[:id]
    favorite.destroy
    head :no_content
  end

  private

  def book
    @book ||= Book.find params[:book_id]
  end

  def favorite
    @favorite ||= Favorite.find params[:id]
  end
end
