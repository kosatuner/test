class Batch

	require 'httparty'
	require 'json'
	require 'csv'


	#stock.indicator_type.first.indicators.order('indicators.fecha DESC').first


	def batchJob

		Stock.all.each do |stock|
			response = HTTParty.get("http://finance.google.com/finance/info?q=#{stock.market.nombre}:#{stock.ticker}")
			obj = JSON.parse(response[3,response.length])
			qoute = obj [0]
			fecha = qoute['lt_dts']
			fecha_final = fecha[0,9]
			#fecha = "2016-10-11"
			price = Price.new
			price.precio = qoute['l']
			price.fecha = fecha
			price.stock = stock
			stock.indicator_type.each do |indicator_type|
				indicator = Indicator.new
				indicator.indicator_type = indicator_type
				indicator.stock = stock
				indicator.fecha = fecha
				if indicator.calcular(price)
					indicator.save
				end
			end
			price.save
		end
	end

	def CreateStockTickers
		market = Market.find(1)
		str = ["APBR","AUSO","BHIP","BMA","BOLT","BPAT","BRIO6","BRIO","CADO","CAPU","CAPX","CARC","CECO2","CELU","CEPU","COLO","COME","CRES","CTIO","DGCU2","DOME","DYCA","EDN","FERR","FIPL","FRAN","GARO","GCLA","GGAL","GRIM","HAVA","INDU","INTR","INVJ","IRSA","JMIN","LEDE","LONG","METR","MIRG","MOLI","MORI","OEST","PAMP","PATA","PATY","PESA","PETR","POLL","PSUR","REP","SAMI","SEMI","STD","SUPV","TECO2","TEF","TGNO4","TGSU2","TRAN"]
		str.each do |ticker|
			nombre = "pre"
			stock = Stock.new()
			stock.ticker = ticker
			stock.nombre = nombre
			stock.market = market
			stock.save
		end
	end

	def csvImport
		CSV.foreach('/home/kosatuner/RubyProjects/AccionesDev/bin/seriePrueba.csv') do |row|
			puts row.inspect
			precio = Price.new
			stock = Stock.where(ticker: row[0])[0]
			puts stock
			unless stock.nil?
				puts "no nulo"
				precio.stock = stock
				precio.fecha = row[1]
				precio.precio = row[2]
				precio.save
				mediaCuatro = Indicator.new
				mediaCuatro.indicator_type = IndicatorType.where(id: "1")[0]
				mediaCuatro.stock = stock
				mediaCuatro.valor = row[3]
				mediaCuatro.fecha = row[1]
				mediaNueve = Indicator.new
				mediaNueve.indicator_type = IndicatorType.where(id: "2")[0]
				mediaNueve.stock = stock
				mediaNueve.valor = row[4]
				mediaNueve.fecha = row[1]
				mediaDieOch = Indicator.new
				mediaDieOch.indicator_type = IndicatorType.where(id: "3")[0]
				mediaDieOch.stock = stock
				mediaDieOch.valor = row[5]
				mediaDieOch.fecha = row[1]
				mediaNueve.save
				mediaCuatro.save
				mediaDieOch.save
			end
		end
	end


	def importInicialTest
		CSV.foreach('/home/kosatuner/RubyProjects/AccionesDev/bin/serieincial.csv') do |row|
			puts row.inspect
			precio = Price.new
			stock = Stock.where(ticker: row[0])[0]
			puts stock
			unless stock.nil?
				puts "no nulo"
				precio.stock = stock
				precio.fecha = row[1]
				precio.precio = row[2]
				precio.save
				mediaCuatro = Indicator.new
				mediaCuatro.indicator_type = IndicatorType.where(id: "1")[0]
				mediaCuatro.stock = stock
				mediaCuatro.valor = row[3]
				mediaCuatro.fecha = row[1]
				mediaNueve = Indicator.new
				mediaNueve.indicator_type = IndicatorType.where(id: "3")[0]
				mediaNueve.stock = stock
				mediaNueve.valor = row[4]
				mediaNueve.fecha = row[1]
				mediaDieOch = Indicator.new
				mediaDieOch.indicator_type = IndicatorType.where(id: "2")[0]
				mediaDieOch.stock = stock
				mediaDieOch.valor = row[5]
				mediaDieOch.fecha = row[1]
				mediaNueve.save
				mediaCuatro.save
				mediaDieOch.save
			end
		end
	end
end


if __FILE__ == $0
	bathc = Batch.new
	#
	bathc.batchJob
end