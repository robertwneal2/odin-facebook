class AddUserToComments < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :comments, :user, foreign_key: true
  end
end
