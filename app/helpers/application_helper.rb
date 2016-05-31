module ApplicationHelper
  def user_favorite
    @user_favorite ||= @book.favorite_for(current_user)
  end

  def user_like(memo)
    @user_like = memo.like_for(current_user)
  end
end
