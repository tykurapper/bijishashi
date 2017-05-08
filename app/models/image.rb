class Image < ActiveRecord::Base
    mount_uploader :file, ImageUploader
    belongs_to :user
    belongs_to :category
    has_many :image_comment, -> { order "created_at DESC"}
    has_many :likes
end
