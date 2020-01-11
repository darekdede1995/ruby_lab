class PriceValidator < ActiveModel::Validator
  def validate(record)
    if !((record.event.price_low <= record.price) && (record.event.price_high >= record.price))
      record.errors.add('Cena', 'nie mieści się w przedziale cenowym wydarzenia')
    end
  end
end

class Ticket < ApplicationRecord
  include ActiveModel::Validations
  validates_with PriceValidator

  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :email_address, :presence => true
  validates :price, :presence => true
  belongs_to :event
end
