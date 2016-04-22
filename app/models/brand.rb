# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  attachement :string(255)
#  image_id    :string(255)
#

class Brand < ActiveRecord::Base
  attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
end
