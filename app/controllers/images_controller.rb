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

class ImagesController < ApplicationController
  before_action :require_admin
  def index
    @images = Image.includes(:gallery).where("images.category_id IS NULL OR images.category_id = '#{session['category']}'").order('images.created_at DESC')
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
    @galleries = Gallery.all.order('galleries.created_at ASC')
  end

  def create
    @image = Image.new(image_params)
    !@image.save && (redirect_to new_image_path)
    redirect_to images_path
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    !@image.update_attributes(image_params) && (redirect_to edit_image_path)
    redirect_to @image
  end

  def create_from_gallery
    @image = Image.new(image_params)
    @image.save
    redirect_to edit_galleries_path(@galeries), turbolinks: true
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:description, :file, :gallery_id, :category_id)
  end
end
