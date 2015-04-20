class OrchestratorController < ApplicationController
	protect_from_forgery except: :send_location

	def home

	end

	def send_location
		puts params
		render :json => {"test" => "jason"}
	end
end
