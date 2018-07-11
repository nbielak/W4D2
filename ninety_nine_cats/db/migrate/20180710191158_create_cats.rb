class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :sex, limit: 1
      t.text :description, null: false
      t.timestamps
    end

    add_index :cats, :name
  end
end
