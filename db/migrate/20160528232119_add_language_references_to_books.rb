class AddLanguageReferencesToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :language, index: true, foreign_key: true
  end
end
