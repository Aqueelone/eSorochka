# == Schema Information
#
# Table name: product_codes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  product_id  :integer
#  category_id :integer
#  color_id    :integer
#  picture_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductCodesController < ApplicationController
  before_action :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    @product_codes = ProductCode.where("product_codes.category_id IS NULL OR product_codes.category_id = '#{session['category']}'").order('product_codes.created_at ASC')
  end

  def show
    @product_code = ProductCode.find(params[:id])
    @product = Product.find(@product_code.product_id)
    @color = Color.find(@product_code.color_id)
    @picture = Image.find(@product_code.picture_id)
    @category = Category.find(@product_code.category_id)
  end

  def new
    @product_code = ProductCode.new
    @product_without_pc = []
    Product.all.each do |p|
      Gallery.where("galleries.product_id = #{p.id}").map {|g| g.color_id}.each do |c|
        @product_without_pc.push(p) if ProductCode.where("product_codes.product_id = '#{p.id}' AND product_codes.color_id = ('#{c}')").blank?
      end
    end
  end

  def get_free_gallery
    @product = Product.find(params[:product_code][:product_id])
    @gallery_all_for = Gallery.where("galleries.product_id = #{params[:product_code][:product_id]}")
    @galleries = []
    @gallery_all_for.each do |g|
      @galleries.push(g) if ProductCode.where("product_codes.product_id = '#{params[:product_code][:product_id]}' AND product_codes.color_id = ('#{g.color_id}')").blank?
    end
    render :partial => 'color'
  end

  def set_gallery
    @gallery = Gallery.find(params[:product_code][:gallery_id])
    @images = Image.where("images.gallery_id - #{@gallery.id}")
    @color = Color.find(@gallery.color_id)
    render :partial => 'images'
  end

  def create
    @product_code = ProductCode.new(product_code_params)
    @product = Product.find(params[:product_code][:product_id])
    @product_code.product_id = params[:product_code][:product_id]
    @category = Category.find(params[:product_code][:category_id])
    @product_code.category_id = params[:product_code][:category_id]
    @color = Color.find(params[:color_id])
    @product_code.color_id = params[:color_id]
    @product_id_pc = @product.id.to_s;
    while (@product_id_pc.length < 5) do
      @product_id_pc = '0' + @product_id_pc
    end
    @category_id_pc = @category.name_ua.split(" ").map { |s| s[0,1] }.join()
    @color_id_pc= @color.name.split("-").map { |s| s[0,3] }.join()
    @product_code.name = @category_id_pc + @product_id_pc + @color_id_pc
    !@product_code.save && (redirect_to new_product_code_path)
    redirect_to product_codes_path
  end

  def edit
    @product_code = ProductCode.find(params[:id])
  end

  def update
    @product_code = ProductCode.find(params[:id])
    !@product_code.update_attributes(product_code_params) && (redirect_to edit_product_code_path)
    redirect_to @product_code
  end

  def destroy
    @product_code = ProductCode.find(params[:id])
    @product_code.destroy
    redirect_to product_codes_path
  end

  private

  def product_code_params
    params.require(:product_code).permit(:id, :name, :product_id, :color_id, :category_id, :picture_id)
  end
end
