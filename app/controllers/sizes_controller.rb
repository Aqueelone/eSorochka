# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  sign       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SizesController < ApplicationController
    def index
      @sizes = Size.all.order('sizes.id ASC')
    end

    def show
      @size = Size.find(params[:id])
    end

    def new
      @size = Size.new
    end

    def create
      @size = Size.new(size_params)
      !@size.save && (redirect_to new_size_path)
      redirect_to sizes_path
    end

    def edit
      @size = Size.find(params[:id])
    end

    def update
      @size = Size.find(params[:id])
      !@size.update_attributes(size_params) && (redirect_to edit_size_path)
      redirect_to @size
    end

    def destroy
      @size = Size.find(params[:id])
      @size.destroy
      redirect_to sizes_path
    end

    private

    def size_params
      params.require(:size).permit(:name, :sign)
    end
end
