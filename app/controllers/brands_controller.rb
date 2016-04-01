# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  attachement :string(255)
#  image_id    :string(255)
#

class BrandsController < ApplicationController
  before_action :require_admin
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    !@brand.save && (redirect_to new_brand_path)
    redirect_to brands_path
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    !@brand.update_attributes(brand_params) && (redirect_to edit_brand_path)
    redirect_to @brand
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :image)
  end
end
