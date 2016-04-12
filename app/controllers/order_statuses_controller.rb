# == Schema Information
#
# Table name: order_statuses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class OrderStatusesController < ApplicationController
  def index
    @order_statuses = OrderStatus.all.order('order_statuses.id ASC')
  end

  def show
    @order_status = OrderStatus.find(params[:id])
  end

  def new
    @order_status = OrderStatus.new
  end

  def create
    @order_status = OrderStatus.new(order_status_params)
    !@order_status.save && (redirect_to new_order_status_path)
    redirect_to order_statuses_path
  end

  def edit
    @order_status = OrderStatus.find(params[:id])
  end

  def update
    @order_status = OrderStatus.find(params[:id])
    !@order_status.update_attributes(order_status_params) && (redirect_to edit_order_status_path)
    redirect_to @order_status
  end

  def destroy
    @order_status = OrderStatus.find(params[:id])
    @order_status.destroy
    redirect_to order_statuses_path
  end

  private

  def order_status_params
    params.require(:order_status).permit(:name, :sign)
  end
end
