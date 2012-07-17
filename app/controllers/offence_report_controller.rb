class OffenceReportController < ApplicationController
  
  def view
    @video = Video.find(params[:id]) || not_found
  end
  
  def report
  end
  
  private
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end