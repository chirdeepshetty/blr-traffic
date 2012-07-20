class OffenceReportController < ApplicationController
  
  def report
    video = Video.find(params[:id]) || not_found
    Offence.create!(:time => params[:time], :ip => request.remote_ip, :video => video)
    render :text => "success", :layout => false
  end
  
  def offences
    video = Video.find(params[:id]) || not_found
    @offences = video.offences.order(:time).group(:time).count
    logger.info @offences.inspect
    normalize
  end
  
  private
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def normalize
    @offences.keys.each do |time|
      if @offences[time -1] then
        @offences[time -1] += @offences[time]
        @offences.delete(time)
      end
    end
    
  end
end