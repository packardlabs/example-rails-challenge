require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  describe '#index' do
    before { get :index }

    it { should respond_with :success  }
    it { should render_template :index }
  end

  describe '#show' do
    let!(:user) { create :user }
    let!(:credit_card_charge) { create :credit_card_charge, chargeable: user }

    before {
      get :show, id: credit_card_charge.unique_code
    }

    it { should render_template :show }
    it { should respond_with :success }
  end

  describe '#new' do
    before { get :new }

    it { should render_template :new }
    it { should respond_with :success }
  end

  describe '#create' do
    let!(:user) { create :user }
    let!(:user_credit_card_charge_count) { user.credit_card_charges.count }

    context 'success' do
      before do
        post :create, credit_card_charge: {
          amount: 23.99,
          chargeable: user.to_global_id,
        }
      end

      let!(:new_credit_card_charge) { CreditCardCharge.last }

      it { expect(user.credit_card_charges.count).to eq user_credit_card_charge_count + 1 }
      it { expect(new_credit_card_charge.amount).to eq Money.new(2399) }
      it { should redirect_to charge_path(new_credit_card_charge) }
    end

    context 'no chargeable' do
      before do
        post :create, credit_card_charge: {}
      end

      it { should redirect_to new_charge_path }
    end
  end
end
