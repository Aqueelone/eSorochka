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

class ColorsController < ApplicationController
  before_action :require_admin
  def index
    @colors = Color.all.order('colors.color_gid DESC')
  end

  def show
    @color = Color.find(params[:id])
  end

  def gid
    @color = Color.find(params[:id])
    render json: {'gid' => "#{@color.color_gid}"}
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    !@color.save && (redirect_to new_colors_path)
    redirect_to colors_path
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    !@color.update_attributes(color_params) && (redirect_to edit_colors_path)
    redirect_to @color
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to colors_path
  end

  private

  def color_params
    params.require(:color).permit(:name, :color_gid)
  end
end
