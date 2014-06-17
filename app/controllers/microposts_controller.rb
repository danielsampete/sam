class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      if @micropost.content.length==0
        flash[:error] = "Micropost cant be empty"
      else
        flash[:error] = "Length of a micropost cant exceed 140 characters "
      end
      redirect_to root_url
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  def favouritedby # added for a page to show fav users of a post in a seperate pg but yet to complet4 it
  @post = Micropost.find(params[:id])
  @users = @post.favby_users
  render 'show_favusers'
  end

  private
  
    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
  
end