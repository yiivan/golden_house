class My::MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book
  before_action :find_and_authorize_memo, only: [:edit, :update, :destroy]

  def create
    @memo          = Memo.new memo_params
    @memo.book     = @book
    @memo.user     = current_user
    respond_to do |format|
      if @memo.save
        format.html { redirect_to my_book_path(@book), notice: "Thanks for writing a memo!" }
      else
        flash.now[:alert] = "not saved"
        format.html { render "/my/books/show" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @memo.update memo_params
        format.js { render :update_success }
      else
        format.js { render :update_failure }
      end
    end
  end

  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to book_path(@book), notice: "Memo deleted!" }
      format.js { render }
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:body, :public, extra_memos_attributes: [:title, :body, :id, :_destroy])
  end

  def find_book
    @book = Book.find params[:book_id]
  end

  def find_and_authorize_memo
    @memo = @book.memos.find params[:id]
    redirect_to root_path unless can? :crud, @memo
  end
end
