class BlogsController < ApplicationController
  def index
    sender_ids = Message.where(sender_id: current_user.id).pluck(:id)
    @sent_messages = Recipient.where(message_id: sender_ids).order('created_at DESC')

    @recieved_message = Recipient.where(login_id: current_user.id)
  end
end
