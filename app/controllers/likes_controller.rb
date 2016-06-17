class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like          = Like.new
    like.user     = current_user
    like.memo     = memo
    if like.save
      render json: {id: like.id}
    else
      head :internal_server_error
    end
  end

  def destroy
    like = Like.find params[:id]
    like.destroy
    head :no_content
  end

  private

  def book
    @book ||= Book.find params[:book_id]
  end

  def memo
    @memo ||= Memo.find params[:memo_id]
  end
end
