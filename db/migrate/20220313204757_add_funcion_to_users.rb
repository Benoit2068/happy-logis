class AddFuncionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :function, :string
  end
end
