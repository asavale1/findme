# id => integer
# phone_no_cc => string
# phone_with_cc => string
# gcm_regid => text
class Sender < ActiveRecord::Base
	validates :phone_no_cc, presence: true
	validates :phone_with_cc, presence: true
	validates :gcm_regid, presence: true

	has_many :locations

	def self.add(phone_no_cc, phone_with_cc, gcm_regid)
		
		s = Sender.where(:phone_with_cc => phone_with_cc).first
		
		if s.nil?
			s = Sender.new
			s.phone_no_cc = phone_no_cc
			s.phone_with_cc = phone_with_cc
			s.gcm_regid = gcm_regid
			s.save
		else
			s.gcm_regid = gcm_regid
			s.save
		end

		return s
	end
end
