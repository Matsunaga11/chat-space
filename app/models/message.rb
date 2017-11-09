class Message < ApplicationRecord
belongs_to :group
belongs_to :user
validates :image_data, presence: true
mount_uploader :image, ImageUploader

  def image_data
    image.presence || body.presence
  end

  def self.hot_message(group)
        if group.messages.blank?
          "メッセージは送信されていません"
        elsif group.messages.last.body.blank?
          "画像を投稿しました"
        else
          group.messages.last.body
        end
  end
end
