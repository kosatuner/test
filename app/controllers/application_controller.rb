class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def batch
		require 'httparty'
		#require 'JSON'
		Stock.all.each do |stock|
			response = HTTParty.get("http://finance.google.com/finance/info?q=#{stock.market.nombre}:#{stock.ticker}")
			body = response.body
			array = JSON.parse(body(3,body.length))
			qoute = array[0]
			ticker = qoute['t']
			cierre = qoute['l']
			ultimaHora = qoute['lt']
			puts ticker
			puts ultimaHora
		end
	end	
end
