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
#
# Indexes
#
#  index_images_on_gallery_id  (gallery_id)
#

require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

end
