# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  sign       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Size < ActiveRecord::Base
  has_and_belongs_to_many :products
end
