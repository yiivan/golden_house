class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :title
      t.text :body
      t.references :memo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
