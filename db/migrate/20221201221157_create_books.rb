class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :gender
      t.references :author, null: false, foreign_key: true
      t.datetime :publish_date
      t.string :publishing_company

      t.timestamps
    end
  end
end
