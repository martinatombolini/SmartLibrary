class AddOwnerToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :owner, :int
  end
end
