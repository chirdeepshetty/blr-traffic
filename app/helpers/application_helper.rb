module ApplicationHelper
  BASE_URL = "https://gdata.youtube.com/feeds/api/videos/"
  
  def get_view_count(video)
    video_id = video.youtube_link.split("=").last
    response = HttpGateway.get_request(BASE_URL + video_id)
    response["entry"]["statistics"]["viewCount"]
  end
  
  def video_js_link(video)
    video_id = video.youtube_link.split("=").last
    "http://www.youtube.com/v/" + video_id + "?enablejsapi=1&playerapiid=ytplayer&version=3"
  end
  
  def no_of_offences(video)
    result = video.offences.group(:time).count
    result.size
  end
end
