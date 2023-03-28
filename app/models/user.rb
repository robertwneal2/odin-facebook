class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :likes

  has_many :comments

  has_many :friend_invitations, class_name: "FriendRequest", foreign_key: :requester_id
  has_many :requested_friends, through: :friend_invitations, source: :recipient

  has_many :friend_requests, class_name: "FriendRequest", foreign_key: :recipient_id
  has_many :requesting_friends, through: :friend_requests, source: :requester

  has_many :a_friendships, class_name: "Friendship", foreign_key: :friend_a_id
  has_many :a_friends, through: :a_friendships, source: :friend_b

  has_many :b_friendships, class_name: "Friendship", foreign_key: :friend_b_id
  has_many :b_friends, through: :b_friendships, source: :friend_a

  def friends #queries database twice but is easy to read
    a_friends + b_friends
  end
end
