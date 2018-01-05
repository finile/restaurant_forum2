class FriendshipsController < ApplicationController


  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
       redirect_back fallback_location: root_path, notice: "成功加入好友"
      else
        flash[:alert] = @friendship.errors.full_messages.to_sentence
        redirect_back fallback_location: root_path
      end 
  end
end
