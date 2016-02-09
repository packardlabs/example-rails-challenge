class CreditCardCharge < ActiveRecord::Base
  belongs_to :chargeable, polymorphic: true

  validates :unique_code, uniqueness: true

  before_create :generate_unique_code

  monetize :amount_cents

  scope :disputed,   -> { where(paid: true, refunded: true) }
  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed,     -> { where(paid: false) }

  def state
    if paid? && refunded?
      'disputed'
    elsif paid?
      'successful'
    else
      'failed'
    end
  end

  def to_param
    unique_code
  end

  private

  def generate_unique_code
    self.unique_code = SecureRandom.hex
  end
end
