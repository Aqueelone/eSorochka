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
  before_action :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    @products = Product.where("products.category_id IS NULL OR products.category_id = '#{session['category']}'").order('products.created_at ASC')
  end

  def show
    @product = Product.find(params[:id])
    @galleries = Gallery.where("galleries.product_id = '#{params[:id]}'")
    !@galleries.blank? && (@fabric = Fabric.find(@galleries.first.fabric_id))
  end

  def view
    @product = Product.find(params[:id])
    @galleries = Gallery.where("galleries.product_id = '#{params[:id]}'")
    !@galleries.blank? && (@fabric = Fabric.find(@galleries.first.fabric_id))
    @orders = Order.uncached do
      Order.where(:temporary => session['temporary'], :closed => false)
    end
    @orders.blank? && (redirect_to root_path)
    !@orders.blank? && (@order = @orders.last)
    @amounts = []
    @product_codes_ids = ProductCode.where(product_id: @product.id).map {|p| p.id}
    @temper = session['temporary']
    OrderItem.all.where(temporary: @temper, :product_code_id => @product_codes_ids).each do |oi|
      @amounts[oi.product_code_id] = oi.amount
    end
    session['deffered'].delete_if {|d| d == @product.id}
    session['deffered'] << @product.id
    session['deffered'].uniq.compact
  end

  def show_mode
    session['view'] = params[:product][:view]
    respond_to do |format|
      format.js
    end
  end

  def show_product
    @product = Product.find(params[:id])
    @galleries = Gallery.where("galleries.product_id = '#{params[:id]}'")
    !@galleries.blank? && (@fabric = Fabric.find(@galleries.first.fabric_id))
    @orders = Order.uncached do
      Order.where(:temporary => session['temporary'], :closed => false)
    end
    @orders.blank? && (redirect_to root_path)
    !@orders.blank? && (@order = @orders.last)
    @amounts = []
    @product_codes_ids = ProductCode.where(product_id: @product.id).map {|p| p.id}
    @temper = session['temporary']
    OrderItem.all.where(temporary: @temper, :product_code_id => @product_codes_ids).each do |oi|
      @amounts[oi.product_code_id] = oi.amount
    end
    @locale = (!params[:locale].blank? && ('?locale=' + params[:locale]))||''
    session['deffered'].delete_if {|d| d == @product.id}
    session['deffered'] << @product.id
    session['deffered'].uniq.compact
    render :partial => 'prod'
  end

  def show_full
    @product = Product.find(params[:id])
    @galleries = Gallery.where("galleries.product_id = '#{params[:id]}'")
    !@galleries.blank? && (@fabric = Fabric.find(@galleries.first.fabric_id))
    @height = params[:height].to_i + 200
    @width = @height * 3 / 4
    render :partial => 'full'
  end

  def get_deffered
    if( defined? params[:product][:shift])
      params[:product][:shift] == 'left' && @shift = session['deffered'].last
      params[:product][:shift] == 'right' && @shift = session['deffered'].first
      session['deffered'].delete_if {|d| d == @shift}
      params[:product][:shift] == 'left' && session['deffered'].unshift(@shift)
      params[:product][:shift] == 'right' && session['deffered'] << @shift
      session['deffered'].uniq.compact
    end
    render :partial => 'deffered'
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
    @galleries_for_add = Gallery.where("galleries.category_id = '#{session['category']}'")
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

  def get_catalog
    @products = Product.where("products.category_id = '#{session['category']}'").order('products.id ASC')
    @width = params[:width].to_i
    @pointX = @width/2 -122
    @point = @pointY = @pointX
    @top = 230
    @step = 270
    @topstep = 12
    @zindex = 100000
    @aspect = 0
    @pleft = 0
    @pright = 0
    @k = 1
    @hash = []
    @pos = 'start'
    @products.each do |p|
      if(@pos != 'start')
        if(@pos == 'left')
          @pos = 'right'
          @point = @pointX -= @step
          @point < 30 && @point = 30
          @aspect = -@pright +=1
          @top -= @topstep
          @top < 120 && @top = 120
          @zindex -= 1
        else
          @pos = 'left'
          @point = @pointY += @step
          @point > @width * 0.78 && @point = @width * 0.78
          @aspect = @pleft += 1
          @step -= @step/(2*@k)
          @k++
          @topstep += 10 + (@topstep /2)
        end
      else @pos = 'left'
      end
      @hash[p.id] = {'point' => @point, 'top' => @top, 'zindex' => @zindex, 'aspect' => @aspect}
    end
    @locale = (!params[:locale].blank? && ('?locale=' + params[:locale]))||''
    session['view'] == 'grid' &&(render :partial => 'cat2')
    session['view'] == 'showcase' && (render :partial => 'cat1')
    (session['view'] != 'showcase' && session['view'] != 'grid') && (redirect_to root_path)
  end

  def remove_deffered
    session['deffered'] = session['deffered'].delete_if {|d| d == params[:product][:deffered].to_i}
    session['deffered'] = session['deffered'].compact
    render :partial => 'deffered'
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
                                    :cut_type, :collar_type, :sleeve_type, :cuff_type, :style_type,
                                    :deffered, :shift, :view)
  end
end
