class Indicator < ActiveRecord::Base
  belongs_to :stock
  belongs_to :indicator_type

  # def indicatortype=(indicatortype)
  # 	self.indicatortype
  # end

  def calcular(precio)
    @anterior = get_anterior
    @current = precio
  	case self.indicator_type.nombre
  	when "Media Movil 4"
  		calcularMedia4
	  when "Media Movil 18"
		  calcularMedia18
    when "Media Movil 9"
      calcularMedia9
    when "MACD"
      calcularMACD
	  end
  end

  def calcularMedia4
  	self.valor = @anterior.valor + (2*(@current.precio - @anterior.valor) / 5)
    calc_signal
  end

  def calcularMedia18
  	self.valor = @anterior.valor + (2*(@current.precio - @anterior.valor) / 19)
    calc_signal
  end

  def calcularMedia9
    self.valor = @anterior.valor + (2*(@current.precio - @anterior.valor) / 10)
    calc_signal
  end

  def calc_signal
    if self.valor > @current.precio
      self.signal = "Venta"
    elsif self.valor < @current.precio
      self.signal = "Compra"
    end    
  end

  def calcularMACD
    self.valor = get_media9anterior.valor - get_media18anterior.valor

    if self.valor >= 0 && @anterior.valor < 0
      self.signal = "Compra"
    elsif self.valor > 0 && @anterior.valor > 0
      self.signal = "Dentro"
    elsif self.valor < 0 && @anterior.valor >= 0
      self.signal = "Venta"
    elsif self.valor < 0 && @anterior.valor < 0
      self.signal = "Fuera"
    end
  end

  def get_anterior
    Indicator.where(stock_id: self.stock_id, indicator_type_id: self.indicator_type_id).order('indicators.fecha DESC').first
  end

  def get_media9anterior
    type = IndicatorType.new.get_media9
    Indicator.where(stock_id: self.stock_id, indicator_type_id: type.id).order('indicators.fecha DESC').first
  end
  def get_media18anterior
    type = IndicatorType.new.get_media18
    Indicator.where(stock_id: self.stock_id, indicator_type_id: type.id).order('indicators.fecha DESC').first
  end
end
