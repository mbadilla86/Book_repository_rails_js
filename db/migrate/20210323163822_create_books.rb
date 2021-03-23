class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :edition, default: 1
      t.string :publisher
      t.string :isbn
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
