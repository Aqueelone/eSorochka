# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name_ua     :string(255)
#  name_ru     :string(255)
#  name_en     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  parent_id   :integer
#  visible     :boolean          default(FALSE)
#  attachement :string(255)
#  image_id    :string(255)
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#

class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => "Category"
  has_many :childs, :class_name => "Category", :foreign_key => "parent_id"
  attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
end
