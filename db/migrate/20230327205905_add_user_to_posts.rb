class AddUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :posts, :user, foreign_key: true, default: 1
  end
end
