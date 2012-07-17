class Video < ActiveRecord::Base
  has_many :offences, :dependent => :destroy
end