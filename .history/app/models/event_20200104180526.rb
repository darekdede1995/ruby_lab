class PastDateValidator < ActiveModel::Validator
  def validate(record)
    if record.event_date < Date.today
      record.errors.add('Data wydarzenia', 'nie może być z przeszłości')
    end
  end
end

class PriceRangeValidator < ActiveModel::Validator
  def validate(record)
    if record.price_low > record.price_high
      record.errors.add('Cena maksymalna', 'nie może być mniejsza niż cena minimalna')
    end
  end
end

class Event < ApplicationRecord
  include ActiveModel::Validations
  validates_with PastDateValidator
  validates_with PriceRangeValidator

  validates :artist, :presence => true
  validates :price_low, :presence => true, numericality: true
  validates :price_high, :presence => true, numericality: true
  validates :event_date, :presence => true
  has_many :tickets
end
