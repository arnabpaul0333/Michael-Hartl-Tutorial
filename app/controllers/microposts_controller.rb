class MicropostsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to user_path(current_user)
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def destroy
    @micropost.destroy
    redirect_to user_path(current_user)
  end

  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
