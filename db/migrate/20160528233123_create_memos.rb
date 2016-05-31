class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.text :body
      t.boolean :public
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
