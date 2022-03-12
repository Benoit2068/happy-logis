class AddFunctionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :function, :string)
    add_column(:users, :name, :string)
  end
end
