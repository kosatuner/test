class Stock < ActiveRecord::Base
  belongs_to :market
  has_many :prices
  has_many :indicators
  has_many :has_indicator_typer
  has_many :indicator_type, through: :has_indicator_typer

  validates :ticker, presence: true
  validates :nombre, presence: true
  validates :market, presence: true

  after_create :save_indicatorTypes
  after_update :update_indicatorTypes

  def indicatorTypes=(value)
  	@indicatorTypes = value
  end

  def update_indicatorTypes
    @indicatorTypes.each do |indic|
      HasIndicatorTyper.create(stock_id: self.id, indicator_type_id: indic)
    end
  end

  def save_indicatorTypes
  	@indicatorTypes.each do |indic|
  		HasIndicatorTyper.create(stock_id: self.id, indicator_type_id: indic)
  	end
  end
end
