class FavrelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @post = Micropost.find(params[:favrelationship][:favmp_id])
    @post.favourite!(current_user)
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end

  def destroy
    @post = Favrelationship.find(params[:id]).favmp
    #user = Favrelationship.find(params[:id]).followed
    @post.unfavourite!(current_user)
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
end