class AddUserToLikes < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :likes, :user, foreign_key: true
  end
end
