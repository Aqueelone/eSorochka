# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  show        :boolean
#  amount_min  :integer
#  amount_max  :integer
#  price_min   :integer
#  price_max   :integer
#  cut_type    :string(255)
#  collar_type :string(255)
#  sleeve_type :string(255)
#  cuff_type   :string(255)
#  style_type  :string(255)
#  brand_id    :integer
#  category_id :integer
#  picture_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ProductsController < ApplicationController
  def index
    @products = Product.all.order('products.id ASC')
  end

  def show
    @product = Product.find(params[:id])
    @galleries = Gallery.where("galleries.product_id = '#{params[:id]}'")
    !@galleries.blank? && (@fabric = Fabric.find(@galleries.first.fabric_id))
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @sizes_ids = params[:product][:size_ids].reject { |s| s.empty? }
    @sizes = Size.where("sizes.id IN (#{@sizes_ids.join(',')})")
    !@product.save && (redirect_to new_product_path)
    redirect_to edit_product_path(@product), :notice => 'please, select gallery!'
  end

  def edit
    @product = Product.find(params[:id])
    @galleries = Gallery.where("galleries.product_id = '#{params[:id]}'")
    !@galleries.blank? && (@fabric = Fabric.find(@galleries.first.fabric_id))
    @color_ids = @galleries.map { |g| g.color_id}
    !@color_ids.blank? && (@colors = Color.where("colors.id IN (#{@color_ids.join(',')})"))
    @galleries_for_add = Gallery.all
    !@fabric.blank? && (@galleries_for_add = Gallery.where("galleries.fabric_id = #{@fabric.id}"))
    !@galleries.blank? && (@galleries_for_add -= @galleries)
    session['product_id'] = @product.id
  end

  def update
    @product = Product.find(params[:id])
    @sizes_ids = params[:product][:size_ids].reject { |s| s.empty? }
    @sizes = Size.where("sizes.id IN (#{@sizes_ids.join(',')})")
    @product.sizes = @sizes
    !@product.update(product_params) && (redirect_to edit_product_path)
    redirect_to @product
  end

  def picture
    @product = Product.find(params[:id])
    !@product.permit(:picture_id).update(params[:picture_id]) && (redirect_to edit_product_path)
    redirect_to edit_product_path( session['product_id'])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand_id, :category_id, :description, :picture_id,
                                    :price_min, :price_max, :amount_min, :amount_max, {size_ids:[]},
                                    :cut_type, :collar_type, :sleeve_type, :cuff_type, :style_type)
  end
end
