class PolymorphicChargable < ActiveRecord::Migration
  def change
    add_column :credit_card_charges, :chargeable_id, :integer
    add_column :credit_card_charges, :chargeable_type, :string
  end
end
