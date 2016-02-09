class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.string  :unique_code
      t.boolean :paid, default: false
      t.boolean :refunded, default: false
      t.timestamps null: false
    end
  end
end
