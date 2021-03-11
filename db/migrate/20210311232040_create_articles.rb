class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user,         null: false,foreign_key: true
      t.string     :title,        null: false
      t.integer    :genre_id,     null: false
      t.integer    :category_id,  null: false
      t.text       :text,         null: false

      t.timestamps
    end
  end
end