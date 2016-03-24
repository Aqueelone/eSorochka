# == Schema Information
#
# Table name: messengers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Messenger < ActiveRecord::Base
  belongs_to :dashboard

end
