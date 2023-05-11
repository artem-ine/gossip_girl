class LikesController < ApplicationController

  def create
    puts params.inspect
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.new(user: current_user, gossip_id: params[:gossip_id])

    if @like.save
      redirect_to gossip_path(@like.gossip_id), 
      flash: { like_success: 'You liked this gossip.' }
    else
      redirect_to gossip_path(@like.gossip_id), 
      flash: { like_fail: 'You have already liked this gossip. We get it.' }
    end
  end


  def destroy
    @like = Like.find(params[:id])
    @gossip = @like.gossip
    @like.destroy
    redirect_to gossip_path(@like.gossip_id),
    flash: { dislike: 'You have rescinded your like.'}
    end
    
end

