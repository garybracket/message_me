class MessagesController < ApplicationController
  before_action :require_user

  def show
  end

  def index

  end

  def new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:body)
    end

end
