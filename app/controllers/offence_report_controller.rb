class OffenceReportController < ApplicationController
  
  def view
    @video = Video.find(params[:id]) || not_found
  end
  
  def report
    video = Video.find(params[:id]) || not_found
    Offence.create!(:time => params[:time], :ip => request.remote_ip, :video => video)
    render :text => "success", :layout => false
  end
  
  private
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end