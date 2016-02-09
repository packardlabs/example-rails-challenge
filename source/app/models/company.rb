class Company < ActiveRecord::Base
  has_many :credit_card_charges, as: :chargeable
end
