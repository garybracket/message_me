class ChatroomController < ApplicationController
  before_action :require_user

  def show
  end

  def index
    @current_user = current_user
    @message = Message.new
    @messages = Message.all
    @users = User.all_except(@current_user)
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
