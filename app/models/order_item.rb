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

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :last_order, class_name: "Order", foreign_key: "last_order_id"
  belongs_to :product_code
  belongs_to :user
end
