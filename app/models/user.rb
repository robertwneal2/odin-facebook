class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments
  has_many :requested_friends, class_name: "FriendRequest", foreign_key: :requester_id
  has_many :friend_requests, class_name: "FriendRequest", foreign_key: :recipient_id
end
