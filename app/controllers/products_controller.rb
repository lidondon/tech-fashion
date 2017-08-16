class ProductsController < ApplicationController
	def index
  		@products = Product.all
  end

  def create
  		@product = Product.new product_params
  		if @product.save
  			if params[:product] != nil
  				err = params[:product].to_s;
  				params[:product_photos]['image'].each do |a|
  					@product.product_photos.create(image: a)
  				end
  			end
  			# redirect_to @product
  			flash[:notice] = err
  			render :new 
  		else
  			flash[:notice] = @product.errors.messages
  			render :new 
  		end
  end

  def new
  		@product = Product.new
  		@photos = @product.product_photos.build
  end

  def edit
  end

  def show
  		@product = Product.find(params[:id])
  end

  def update
  end

  def destroy
  end

	private

	def product_params
  		params.require(:product).permit(:name, :category_id, :size, :number, :description, product_photos_attributes: [:image])
  end
end
