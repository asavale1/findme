class OrchestratorController < ApplicationController
	protect_from_forgery except: :send_location
	require 'gcm'

	def home
		#gcm = GCM.new(ENV['GCM_FIND_ME_API_KEY'])
		
	end

	def send_location
		puts params
		render :json => {"test" => "jason"}
	end

	def register_sender
		puts params
		render :json => {"test" => "json"}
	end
end
