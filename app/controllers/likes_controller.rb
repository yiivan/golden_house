class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like          = Like.new
    like.user     = current_user
    like.memo     = memo
    respond_to do |format|
      if like.save
        format.html { redirect_to book_path(book), notice: "Liked!" }
      else
        format.html { redirect_to book_path(book), alert: "You already liked!" }
      end
    end
  end

  def destroy
    like = Like.find params[:id]
    like.destroy
    respond_to do |format|
      format.html { redirect_to book_path(book), notice: "Un-liked!" }
    end
  end

  private

  def book
    @book ||= Book.find params[:book_id]
  end

  def memo
    @memo ||= Memo.find params[:memo_id]
  end
end
