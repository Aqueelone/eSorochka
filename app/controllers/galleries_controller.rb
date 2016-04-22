# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  color_id    :integer
#  fabric_id   :integer
#  product_id  :integer
#  category_id :integer
#
# Indexes
#
#  index_galleries_on_color_id    (color_id)
#  index_galleries_on_fabric_id   (fabric_id)
#  index_galleries_on_product_id  (product_id)
#

class GalleriesController < ApplicationController
  before_action :require_admin
  def index
    @galleries = Gallery.includes(:images).where("galleries.category_id IS NULL OR galleries.category_id = '#{session['category']}'").order('galleries.created_at ASC')
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
    @images = Image.all.order('images.created_at ASC')
  end

  def create
    @gallery = Gallery.new(gallery_params)
    !@gallery.save && (redirect_to new_gallery_path)
    redirect_to galleries_path
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    !@gallery.update_attributes(gallery_params) && (redirect_to edit_gallery_path)
    redirect_to @gallery
  end

  def product
    @gallery = Gallery.find(params[:id])
    !@gallery.update_attributes(gallery_params) && (redirect_to edit_gallery_path)
    redirect_to edit_product_path( session['product_id'])
  end

  def gallery
    @gallery = Gallery.find(params[:id])
    render :partial => 'product'
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:id, :name, :description, :color_id, :fabric_id, :product_id, :category_id, :return_to, images_attributes:[:description, :file])
  end
end
