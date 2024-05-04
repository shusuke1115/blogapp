class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    # add_column :articles, :user_id, :integer
    add_reference :articles, :user
  end
end
