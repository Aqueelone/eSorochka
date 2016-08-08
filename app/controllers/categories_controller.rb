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

class CategoriesController < ApplicationController
  before_action :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    @categories = Category.all.order('categories.parent_id ASC')
  end

  def catalog
    @categories = Category.where("categories.visible = 't'")
    params[:id] && session['category'] = params[:id]
    render :template => 'categories/catalog'
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    !@category.save && (redirect_to new_category_path)
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    !@category.update_attributes(category_params) && (redirect_to edit_category_path)
    redirect_to @category
  end

  def session_update
    session['category'] = params[:id]
    (session['category'] != params[:id] && @err = true) || @err = false
    render :partial => 'box_add'
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name_ua, :name_ru, :name_en, :parent_id, :visible, :image)
  end
end
