class RemoveAuthorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :body：text, :string
  end
end
