require 'rails_helper'

RSpec.describe CreditCardCharge, type: :model do
  it { should belong_to(:chargeable) }

  it { should monetize :amount }

  describe 'to_param' do
    subject(:credit_card_charge) { create :credit_card_charge }

    its(:to_param) { should eq credit_card_charge.unique_code }
    its(:to_param) { should_not eq credit_card_charge.id }
  end

  describe 'unique_code generation' do
    before do
      allow(SecureRandom).to receive(:hex) { 'random_code' }
      expect(SecureRandom).to receive(:hex)
    end

    let(:credit_card_charge) { create :credit_card_charge }

    it 'sets it to SecureRandom.hex value' do
      expect(credit_card_charge.unique_code).to eq 'random_code'
    end
  end

  describe 'states' do
    let!(:disputed_charge) { create :credit_card_charge, :disputed }
    let!(:failed_charge) { create :credit_card_charge, :failed }
    let!(:successful_charge) { create :credit_card_charge, :successful }

    it { expect(disputed_charge.state).to eq 'disputed' }
    it { expect(failed_charge.state).to eq 'failed' }
    it { expect(successful_charge.state).to eq 'successful' }

    context 'disputed scope' do
      it { expect(CreditCardCharge.disputed).to eq [disputed_charge] }
    end

    context 'failed failed' do
      it { expect(CreditCardCharge.failed).to eq [failed_charge] }
    end

    context 'successful scope' do
      it { expect(CreditCardCharge.successful).to eq [successful_charge] }
    end
  end
end
