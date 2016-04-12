# == Schema Information
#
# Table name: product_codes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  product_id  :integer
#  category_id :integer
#  color_id    :integer
#  picture_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductCode < ActiveRecord::Base
  belongs_to :product
  belongs_to :color
  has_one :category, through: :product
  has_one :picture, class_name: "Image", foreign_key: "picture_id"
end
