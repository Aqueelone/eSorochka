# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  description :string(255)
#  attachement :string(255)
#  file_id     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  gallery_id  :integer
#  category_id :integer
#
# Indexes
#
#  index_images_on_gallery_id  (gallery_id)
#

class Image < ActiveRecord::Base
  attachment :file, content_type: ["image/jpeg", "image/png", "image/gif"]
  belongs_to :gallery
  accepts_nested_attributes_for :gallery
  belongs_to :category
end
