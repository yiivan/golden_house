class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :publisher
      t.date :published_date
      t.integer :number_of_pages

      t.timestamps null: false
    end
  end
end
