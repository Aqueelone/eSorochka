# == Schema Information
#
# Table name: dashboards
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  messenger_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_dashboards_on_messenger_id  (messenger_id)
#  index_dashboards_on_user_id       (user_id)
#

class Dashboard < ActiveRecord::Base
  belongs_to :user
end
