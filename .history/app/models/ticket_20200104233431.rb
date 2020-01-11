# class PriceValidateMin < ActiveModel::Validator
#   def validate(record)
#     if !(record.event.price_high >= record.price)
#       record.errors.add('cena', '-zbyt niska cena')
#     end
#   end
# end

# class PriceValidateMax < ActiveModel::Validator
#   def validate(record)
#     if !(record.event.price_low <= record.price)
#       record.errors.add('cena', '-zbyt duza cena')
#     end
#   end
# end

class Ticket < ApplicationRecord
  include ActiveModel::Validations
  # validates_with PriceValidateMin
  # validates_with PriceValidateMax

  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :email_address, :presence => true
  validates :price, :presence => true
  belongs_to :event
  belongs_to :user
end
