class AddBookRefToCopies < ActiveRecord::Migration[5.2]
  def change
    add_reference :copies, :book, foreign_key: true
  end
end
