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
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: "Anon"))
  
    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to welcome_path(@id), flash: { success: 'Gossip was successfully created.' }
    else
      render :new, alert: 'Gossip could not be created.'
    end
  end
    
end
