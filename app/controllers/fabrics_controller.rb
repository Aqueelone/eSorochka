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
#  category_id :integer
#

class FabricsController < ApplicationController
  before_action :require_admin
  def index
    @fabrics = Fabric.where("fabrics.category_id IS NULL OR fabrics.category_id = '#{session['category']}'").order("fabrics.created_at DESC")
  end

  def show
    @fabric = Fabric.find(params[:id])
  end

  def image
    @fabric = Fabric.find(params[:id])
    render :partial => 'image'
  end

  def new
    @fabric = Fabric.new
  end

  def create
    @fabric = Fabric.new(fabric_params)
    !@fabric.save && (redirect_to new_fabrics_path)
    redirect_to fabrics_path
  end

  def edit
    @fabric = Fabric.find(params[:id])
  end

  def update
    @fabric = Fabric.find(params[:id])
    !@fabric.update_attributes(fabric_params) && (redirect_to edit_fabrics_path)
    redirect_to @fabric
  end

  def destroy
    @fabric = Fabric.find(params[:id])
    @fabric.destroy
    redirect_to fabrics_path
  end

  private

  def fabric_params
    params.require(:fabric).permit(:name, :description, :composition, :image, :category_id)
  end
end
