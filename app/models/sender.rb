# id => integer
# phone_number => integer
# gcm_registration_id => text
class Sender < ActiveRecord::Base
	validates :phone_number, presence: true
	validates :gcm_registration_id, presence: true

	def self.add(phone_number, gcm_regid)
		s = Sender.where(:phone_number => phone_number).first
		if s.nil?
			s = Sender.new
			s.phone_number = phone_number
			s.gcm_regid = gcm_regid
			s.save
		end
		
		return s
	end
end
