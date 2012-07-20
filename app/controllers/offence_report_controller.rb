class OffenceReportController < ApplicationController
  
  def report
    video = Video.find(params[:id]) || not_found
    Offence.create!(:time => params[:time], :ip => request.remote_ip, :video => video)
    render :text => "success", :layout => false
  end
  
  def offences
    video = Video.find(params[:id]) || not_found
    @offences = video.offences.group(:time).count
  end
  
  private
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end