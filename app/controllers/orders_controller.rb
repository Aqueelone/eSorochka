# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  cell            :string(255)
#  comment         :string(255)
#  user_id         :integer
#  stuff_id        :integer
#  temporary       :uuid
#  closed          :boolean          default(FALSE)
#  total           :integer
#  created_at      :datetime
#  updated_at      :datetime
#  payment_type_id :integer
#  order_status_id :integer
#

class OrdersController < ApplicationController
  def index
    @desc = {}
    @add = 'orders.id '
    ['name', 'email', 'cell', 'temporary'].map { |f| f == params[:sort] && @add = "orders.#{f}" }
    @add += (params[:desc] && ' DESC') || ' ASC'
    (!params[:desc] && @desc["#{params[:sort]}"] = true) || @desc["#{params[:sort]}"] = ''
    @orders = Order.all.order("#{@add}")

  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def new
    @order = Order.new
    @order.temporary = session['temporary']
    @order.order_status_id = 1
    @order_items = OrderItem.new
    @order_items_posible = OrderItem.new
  end

  def newbox
    @order = Order.new
    @order.temporary = session['temporary']
    @order.order_status_id = 1
    @orders = Order.uncached do
      Order.where(:temporary => session['temporary'], :closed => false)
    end
    @orders.blank? && (!@order.save && (redirect_to root_path))
    !@orders.blank? && @order = @orders.last
    @order_items = OrderItem.where(order_id: @order.id)
    render :partial => 'order'
  end

  def create
    @order = Order.new(order_params)
    !@order.save && (redirect_to new_order_path)
    redirect_to edit_order_path @order, :notice => "Add order items please!"
  end

  def edit
    @order = Order.find(params[:id])
    @order.user_id && @user = User.find(@order.user_id)
    !@order.name.blank? || @order.name = ((@user &&@user.name) || '')
    !@order.email.blank? || @order.email =  ((@user &&@user.email) || '')
    !@order.cell.blank? || @order.cell = ((@user &&@user.cell) || '')
    !@order.comment.blank? || @order.comment = ''
    !@order.order_status_id.blank? || @order.order_status_id = 1
    @order_items = OrderItem.where(order_id: @order.id)
    @order_items_posible = OrderItem.where(temporary: @order.temporary, order_id: nil)
  end

  def update
    @order = Order.find(params[:id])
    !@order.update_attributes(order_params) && (redirect_to edit_order_path)
    redirect_to @order
  end

  def approve
    @order = Order.find(params[:id])
    (!@order.update_attributes(order_params) && @err = true) || @err = false
    render :partial => 'order_approve'
  end

  def add_attr
    Rails.cache.delete('order')
    @order = Order.find(params[:id])
    (!@order.update_attributes(order_params) && @err = true) || @err = false
    render :partial => 'box_add'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :cell, :comment, :closed, :user_id, :stuff_id,
                                  :temporary, :payment_type_id, :order_status_id, :sort)
  end
end
