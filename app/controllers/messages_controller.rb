class MessagesController < ApplicationController

  def new
    @message = Message.new
    @recipients = User.all
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.valid?
      @message.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, user_tokens: [])
  end
end
