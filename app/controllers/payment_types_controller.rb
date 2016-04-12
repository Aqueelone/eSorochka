# == Schema Information
#
# Table name: payment_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PaymentTypesController < ApplicationController
  def index
    @payment_types = PaymentType.all.order('payment_types.id ASC')
  end

  def show
    @payment_type = PaymentType.find(params[:id])
  end

  def new
    @payment_type = PaymentType.new
  end

  def create
    @payment_type = PaymentType.new(payment_type_params)
    !@payment_type.save && (redirect_to new_payment_type_path)
    redirect_to payment_types_path
  end

  def edit
    @payment_type = PaymentType.find(params[:id])
  end

  def update
    @payment_type = PaymentType.find(params[:id])
    !@payment_type.update_attributes(payment_type_params) && (redirect_to edit_payment_type_path)
    redirect_to @payment_type
  end

  def destroy
    @payment_type = PaymentType.find(params[:id])
    @payment_type.destroy
    redirect_to payment_types_path
  end

  private

  def payment_type_params
    params.require(:payment_type).permit(:name)
  end
end
