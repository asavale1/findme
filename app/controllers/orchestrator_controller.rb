class OrchestratorController < ApplicationController
	protect_from_forgery except: :send_location
	#require "sms_fu"
	def home
		#sms_fu = SMSFu::Client.configure(:delivery => :action_mailer)
		#sms_fu.deliver("4087056374","at&t","text me if you get this test message - Ameya Savale")
	end

	def send_location
		puts params
		render :json => {"test" => "jason"}
	end
end
