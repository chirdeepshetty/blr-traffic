class HomeController < ApplicationController
  
  def index
    @video = Video.first
    @feedback = Feedback.new
  end
  
end