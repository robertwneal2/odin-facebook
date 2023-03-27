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

  has_many :friendships,
  ->(user) { unscope(:where).where('friend_a_id = ? OR friend_b_id = ?', user.id, user.id) }
end
