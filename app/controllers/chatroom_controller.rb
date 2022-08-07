class ChatroomController < ApplicationController
  before_action :require_user

  def show
  end

  def index
    @message = Message.new
    @messages = Message.all
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
