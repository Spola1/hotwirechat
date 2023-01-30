class MessageNotification < Noticed::Base
  deliver_by :database

  param :message

  def message
    params[:message].body 
  end

  def room_title
    params[:message].room.title 
  end

  def url
    message_path(params[:message])
  end
end