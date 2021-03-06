# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  show        :boolean
#  amount_min  :integer
#  amount_max  :integer
#  price_min   :integer
#  price_max   :integer
#  cut_type    :string(255)
#  collar_type :string(255)
#  sleeve_type :string(255)
#  cuff_type   :string(255)
#  style_type  :string(255)
#  brand_id    :integer
#  category_id :integer
#  picture_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries
  has_many :colors, through: :galleries
  has_many :fabrics, through: :galleries
  has_one :picture, class_name: "Image", foreign_key: "picture_id"
  belongs_to :category
  belongs_to :brand
  has_and_belongs_to_many :sizes
end
