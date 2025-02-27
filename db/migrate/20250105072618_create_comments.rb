class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.text :content
      t.date :published_date

      t.timestamps
    end
  end
end
