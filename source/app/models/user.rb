class User < ActiveRecord::Base
  has_many :credit_card_charges, as: :chargeable

  def name
    [first_name, last_name].join(' ')
  end
end
