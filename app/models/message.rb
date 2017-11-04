class Message < ApplicationRecord
belongs_to :group
belongs_to :user
validates :body, presence: true
mount_uploader :image, ImageUploader

# def contents_exist
#   if :message && :body, presence: true
#     errors.add(":メッセージまたは画像を送信してください。")
#   end
#  end
end
