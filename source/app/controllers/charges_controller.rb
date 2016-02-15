class ChargesController < ApplicationController

  def index
    @charges = CreditCardCharge.all
  end

  def show
    @charge = CreditCardCharge.find_by!(unique_code: params[:id])
  end

  def new
    @charge = CreditCardCharge.new
  end

  def create
    @chargeable = GlobalID::Locator.locate(params[:credit_card_charge][:chargeable])

    unless @chargeable.present?
      redirect_to(new_charge_path) && return
    end

    @charge = @chargeable.credit_card_charges.new(credit_card_charge_params)

    if @charge.save
      redirect_to charge_path(@charge)
    else
      render :new, status: :bad_request
    end
  end

  private

  def credit_card_charge_params
    params.require(:credit_card_charge).permit(
      :amount,
      :paid,
      :refunded,
    )
  end
end
