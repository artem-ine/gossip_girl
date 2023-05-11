class CommentsController < ApplicationController
  
  def edit
    @id = params[:id]
    @comment = Comment.find(params[:id])
  end

  
  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(gossip_id: params[:gossip_id])
    render :new
  end


  def create
    puts params.inspect
    @id = params[:id]
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], user: current_user, gossip_id: params[:gossip_id])
  
    if @comment.save # essaie de sauvegarder en base @gossip
      redirect_to gossip_path(@comment.gossip_id), flash: { success: 'Comment was successfully created.' }
    else
      flash.now[:alert] = 'Comment cannot be blank.'
      render :new
    end
  end


  def update
    puts params.inspect
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to gossip_path(@comment.gossip_id), flash: { success: 'Comment was successfully edited.' }
    else
      puts @comment.errors
      render :edit, alert: 'Comment could not be edited'
    end
  end

  def destroy
    @id = params[:id]
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip_id), flash: { success: 'Comment was successfully deleted.' }
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

end
