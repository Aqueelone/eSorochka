# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name_ua    :string(255)
#  name_ru    :string(255)
#  name_en    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#

module CategoriesHelper
end
