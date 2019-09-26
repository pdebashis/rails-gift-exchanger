class ExchangesController < ApplicationController
	def index
	end

	def new
		@instance = Exchange.new
	end

	def create
		@instance = Exhange.new(exchange_params)
	end

	private
		def exchange_params
		
		end

end
