require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :credit_card_charges }

  describe '#name' do
    subject { create :user, first_name: 'George', last_name: 'Drummond' }
    its(:name) { should eq 'George Drummond' }
  end
end
