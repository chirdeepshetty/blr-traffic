class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new
  end
  
  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.ip = request.remote_ip
    @feedback.save!
    flash[:saved] = "Thanks for your feedback. Its has been saved in our system."
    redirect_to new_feedback_url
  end
  
  def index
    @feedbacks = Feedback.all
  end
end