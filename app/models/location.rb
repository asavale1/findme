# id => integer
# sender_id => integer
# reciever => string
# longitude => float
# latitude => float

class Location < ActiveRecord::Base
	validates :sender_id, presence: true
	validates :recipient, presence: true
	validates :longitude, presence: true
	validates :latitude, presence: true

	belongs_to :sender

	def self.add(sender_id, recipient, longitude, latitude)
		l = Location.new
		l.sender_id = sender_id
		l.recipient = recipient
		l.longitude = longitude
		l.latitude = latitude
		puts longitude
		puts latitude
		l.save

		return l
	end
end
