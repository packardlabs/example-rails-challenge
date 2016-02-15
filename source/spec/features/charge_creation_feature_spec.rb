require 'rails_helper'

feature 'New charge form' do
  let!(:user)    { create :user }
  let!(:company) { create :company }

  scenario 'for company' do
    visit new_charge_path
    select company.name, from: 'credit_card_charge[chargeable]'
    fill_in 'Amount', with: '33.44'
    click_button 'Save'

    expect(page.body).to have_text 'Customer Charge'
    expect(page.body).to have_text company.name
    expect(page.body).to have_text 3344
  end

  scenario 'for user' do
    visit new_charge_path
    select user.name, from: 'credit_card_charge[chargeable]'
    fill_in 'Amount', with: '33.44'
    click_button 'Save'

    expect(page.body).to have_text 'Customer Charge'
    expect(page.body).to have_text user.first_name
    expect(page.body).to have_text user.last_name
    expect(page.body).to have_text 3344
  end
end
