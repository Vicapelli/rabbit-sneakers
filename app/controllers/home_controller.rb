=begin class HomeController < ApplicationController
  

  def index
    @somas = RecentSomas.list
    render json: @somas
  end 

end =end