class HomeController < ApplicationController
  def index
    session[:conversations] ||= []

    @user = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
