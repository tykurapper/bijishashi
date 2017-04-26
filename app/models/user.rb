class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  mount_uploader :file, ImageUploader

  has_many :active_relationships, class_name:  "Relationship",
  foreign_key: "follower_id",
  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
  foreign_key: "followed_id",
  dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
    # Follows a user.
    def follow(other_user)
    	following << other_user
    end

  # Unfollows a user.
  def unfollow(other_user)
  	following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
  	following.include?(other_user)
  end
end
