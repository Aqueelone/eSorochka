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
#

require 'rails_helper'

RSpec.describe Fabric, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
