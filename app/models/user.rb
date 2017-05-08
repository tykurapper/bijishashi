class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :file, ImageUploader
  has_many :likes

  def likes?(post)
    post.likes.where(user_id: id).any?
  end

end
