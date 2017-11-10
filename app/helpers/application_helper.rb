module ApplicationHelper
  def Message.hot_message(group)
        if group.messages.blank?
          "メッセージは送信されていません"
        elsif group.messages.last.body.blank?
          "画像を投稿しました"
        else
          group.messages.last.body
        end
  end
end
