class CreateExtraMemos < ActiveRecord::Migration
  def change
    create_table :extra_memos do |t|
      t.string :title
      t.text :body
      t.references :memo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
