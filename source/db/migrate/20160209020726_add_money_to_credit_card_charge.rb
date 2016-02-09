class AddMoneyToCreditCardCharge < ActiveRecord::Migration
  def change
    add_monetize :credit_card_charges, :amount
  end
end
