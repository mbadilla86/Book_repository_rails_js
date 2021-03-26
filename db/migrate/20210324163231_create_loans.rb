class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.date :check_out, null: false
      t.date :returning
      t.date :dead_line, null: false
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
