class HomeController < ApplicationController
  
  def index
    @videos = Video.all
  end
  
  def about
    
  end
  
end