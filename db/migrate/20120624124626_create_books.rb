class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.decimal :price
      t.integer :user_id
      t.string :condition
      t.string :isbn

      t.timestamps
    end
  end
end
