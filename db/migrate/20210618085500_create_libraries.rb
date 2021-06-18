class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
