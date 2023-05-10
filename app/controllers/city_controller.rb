class CityController < ApplicationController

  def show
    @city = City.find(params[:id])
    city_id = @city.id
    users_in_city = User.where(city_id: city_id).pluck(:id)
    gossips_in_city = Gossip.where(user_id: User.where(city_id: city_id).pluck(:id))
    @gossips = gossips_in_city
  end

end
