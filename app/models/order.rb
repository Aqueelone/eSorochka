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

class Order < ActiveRecord::Base
  has_many :order_items
  accepts_nested_attributes_for :order_items
  belongs_to :user
  belongs_to :stuff, :class_name => "User"
  belongs_to :payment_type
  belongs_to :order_status
end
