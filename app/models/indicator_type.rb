class IndicatorType < ActiveRecord::Base
	has_many :indicators


	def get_media9
		IndicatorType.where(nombre: 'Media movil 9').first
	end
	def get_media18
		IndicatorType.where(nombre: 'Media movil 18').first
	end
end
