#
# 1 Company with 5 successful charges
#
company = FactoryGirl.create(:company)
5.times do
  FactoryGirl.create(
    :credit_card_charge,
    :successful,
    chargeable: company
  )
end

#
# 1 Company with 3 successful charges
#   and 1 disputed charge
#   and 1 failed charge
#
company = FactoryGirl.create(:company)
3.times do
  FactoryGirl.create(
    :credit_card_charge,
    :successful,
    chargeable: company
  )
end
FactoryGirl.create(
  :credit_card_charge,
  :disputed,
  chargeable: company
)
FactoryGirl.create(
  :credit_card_charge,
  :failed,
  chargeable: company
)

#
# 5 Users with 1 successful charge each
#
5.times do
  user = FactoryGirl.create(:user)
  FactoryGirl.create(
    :credit_card_charge,
    :successful,
    chargeable: user
  )
end

#
# 1 User with 2 disputed charges
#   and 1 failed charge
#
user = FactoryGirl.create(:user)
2.times do
  FactoryGirl.create(
    :credit_card_charge,
    :disputed,
    chargeable: user
  )
end
FactoryGirl.create(
  :credit_card_charge,
  :failed
)

#
# 1 User with 3 failed charges
#
user = FactoryGirl.create(:user)
3.times do
  FactoryGirl.create(
    :credit_card_charge,
    :failed,
    chargeable: user
  )
end
