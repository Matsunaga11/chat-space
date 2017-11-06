class Message < ApplicationRecord
belongs_to :group
belongs_to :user
validates :image_data?, presence: true
mount_uploader :image, ImageUploader

def image_data?
  image == "null" &&  body == ""

end

end
