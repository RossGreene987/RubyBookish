class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.string :Borrower, null: false
      t.date :DueDate, null: false

      t.timestamps
    end
  end
end
