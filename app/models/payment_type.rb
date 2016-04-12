# == Schema Information
#
# Table name: payment_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PaymentType < ActiveRecord::Base
  has_many :orders
end
