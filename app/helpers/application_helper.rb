module ApplicationHelper

  def member_get(group)
  group.users.each do |member|
   return member.name
  end
 end
end
