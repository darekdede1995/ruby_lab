class DateValidator < ActiveModel::Validator
  def validate(record)
    if record.event_date < Date.today
      record.errors.add('Data wydarzenia', 'data z przeszlosci')
    end
  end
end

class PriceValidatorMax < ActiveModel::Validator
  def validate(record)
    if record.price_low > record.price_high
      record.errors.add('cena', 'zbyt niska cena')
    end
  end
end

class Event < ApplicationRecord
  include ActiveModel::Validations
  validates_with DateValidator
  validates_with PriceValidatorMax

  validates :artist, :presence => true
  validates :price_low, :presence => true, numericality: true
  validates :price_high, :presence => true, numericality: true
  validates :event_date, :presence => true
  has_many :tickets
end
