# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color_gid  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Color < ActiveRecord::Base
  has_many :galleries
end
