class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :main_gender
      t.string :age

      t.timestamps
    end
  end
end
