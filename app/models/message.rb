class Message < ApplicationRecord
belongs_to :group
belongs_to :user
validates :image_data, presence: true
mount_uploader :image, ImageUploader

  def image_data
    image.presence || body.presence
  end

  def self.hot_message(group)
        if group.messages.last.try(:body)
          group.messages.last.body
        elsif group.messages.last.try(:image)
           "画像を送信しました。"
        else
          "メッセージは送信されていません"
        end
  end
end
