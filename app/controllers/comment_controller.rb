class CommentController < ApplicationController
  def edit
    @id = params[:id]
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(gossip_id: params[:gossip_id])
    render :new
  end

  def create
    puts params.inspect
    @id = params[:id]
    @comment = Comment.new(content: params[:content], user: User.find_by(first_name: "Anon"))
  
    if @comment.save # essaie de sauvegarder en base @gossip
      redirect_to gossip_path(@comment.gossip_id), flash: { success: 'Comment was successfully created.' }
    else
      render :new, alert: 'Comment could not be created.'
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
    redirect_to root_path, flash: { success: 'Comment was successfully deleted.' }
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

end
