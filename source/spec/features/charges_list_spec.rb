require 'rails_helper'

feature 'Charges list' do
  before do
    5.times { create(:credit_card_charge, :successful) }
    4.times { create(:credit_card_charge, :disputed) }
    2.times { create(:credit_card_charge, :failed) }
  end

  scenario 'visiting page' do
    visit charges_path

    expect(page.body).to have_text "Failed charges (2)"
    expect(page.body).to have_text "Successful charges (5)"
    expect(page.body).to have_text "Disputed charges (4)"
  end
end
