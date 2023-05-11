class GossipsController < ApplicationController

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def new
    @gossip = Gossip.new
    @id = params[:id]
    render :new
  end

  def create
    puts params.inspect
    @id = params[:id]
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
  
    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to welcome_path(current_user.first_name), flash: { gossip_success: 'Gossip was successfully created.' }
    else
      render :new, alert: 'Gossip could not be created.'
    end
  end


  
  def edit
    @id = params[:id]
    @gossip = Gossip.find(params[:id])
  end
  
  
  def update
    puts params.inspect
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip), flash: { success: 'Gossip was successfully edited.' }
    else
      render :edit, alert: 'Gossip could not be edited'
    end
  end

  def destroy
    @id = params[:id]
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to welcome_path(current_user.first_name), flash: { success: 'Gossip was successfully deleted.' }
  end

  private
  
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
    
end
