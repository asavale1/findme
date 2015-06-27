class OrchestratorController < ApplicationController
	protect_from_forgery :except => [:send_location, :register_sender]
	require 'gcm'

	def home
		
	end

	def send_location
		puts params
		sender = Sender.where(:phone_with_cc => params[:sender_phone]).first
		recipient = Sender.where("phone_with_cc = ? OR phone_no_cc = ?", params[:recipient_phone], params[:recipient_phone]).first

		Location.add(sender.id, params[:recipient_phone], params[:longitude], params[:latitude])

		if recipient.nil?
			render :json => {"has_account" => false}
		else
			gcm = GCM.new(ENV['GCM_FIND_ME_API_KEY'])
			regids = [recipient.gcm_regid]
			options = {data: { sender: sender.phone_with_cc, longitude: params[:longitude], latitude: params[:latitude] } }
			response = gcm.send(regids, options)
			puts response
			render :json => {"has_account" => true}
		end
		
	end

	def log_location
		sender = Sender.where(:phone_with_cc => params[:sender_phone]).first
		Location.add(sender.id, params[:recipient_phone], params[:longitude],, params[:latitude])
	end

	def has_account
		recipient = Sender.where("phone_with_cc = ? OR phone_no_cc = ?", params[:recipient_phone], params[:recipient_phone]).first
		puts params
		puts "OVER HERE"
		if recipient.nil?
			render :json => { "has_account" => false }
		else
			render :json => { "has_account" => true }
		end
	end

	def register_sender
		puts params
		s = Sender.add(params[:phone_no_cc], params[:phone_with_cc], params[:gcm_regid])
		render :json => s.to_json
	end
end
