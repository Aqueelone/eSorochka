# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  color_id    :integer
#  fabric_id   :integer
#  product_id  :integer
#
# Indexes
#
#  index_galleries_on_color_id    (color_id)
#  index_galleries_on_fabric_id   (fabric_id)
#  index_galleries_on_product_id  (product_id)
#

module GalleriesHelper
end
