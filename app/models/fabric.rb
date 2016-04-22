# == Schema Information
#
# Table name: fabrics
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  composition :string(255)
#  attachement :string(255)
#  image_id    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#

class Fabric < ActiveRecord::Base
  attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
  has_many :galleries
  belongs_to :category
end
