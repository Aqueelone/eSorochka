# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  amount          :integer          default(1)
#  product_code_id :integer
#  order_id        :integer
#  user_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  temporary       :uuid
#  last_order_id   :integer
#

class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all.order('order_items.id ASC')
  end

  def show
    @order_item = OrderItem.find(params[:id])
    @product_code = ProductCode.find(@order_item.product_code_id)
  end

  def new
    @order_item = OrderItem.new
    @order_item.temporary = session['temporary']
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    !@order_item.save && (redirect_to new_order_item_path)
    redirect_to order_items_path
  end

  def create_box
    @order_item = OrderItem.new(order_item_params)
    @order_item.temporary = params[:order_item][:temporary] || session['temporary']
    @amount = params[:order_item][:amount] || 1
    @order_item.amount = @amount
    !@order_item.save && @err = true || @err = false
    render :partial => 'box_add'
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
    !@order_item.update_attributes(order_item_params) && (redirect_to edit_order_item_path)
    redirect_to @order_item
  end

  def add_order
    @order_item = OrderItem.find(params[:id])
    @order_item.update_attributes(order_item_params)
    if (params[:order_item][:order_id] == '')
      @order = Order.find(params[:order_item][:last_order_id])
    else
      if (params[:order_item][:order_id] != '')
        @order = Order.find(params[:order_item][:order_id])
      end
    end
    redirect_to edit_order_path @order
  end

  def add_order_box
    @order_item = OrderItem.find(params[:id])
    @order_item.update_attributes(order_item_params)
    if (params[:order_item][:order_id] == '')
      @order = Order.find(params[:order_item][:last_order_id])
    else
      if (params[:order_item][:order_id] != '')
        @order = Order.find(params[:order_item][:order_id])
      end
    end
    render :partial => 'box_add'
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to order_items_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_code_id, :amount, :order_id, :last_order_id, :temporary)
  end
end
