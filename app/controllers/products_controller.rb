class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def index
		@products = Product.find(:all)
    end

    def create
    	@product = Product.new(params[:product])
    	if @product.save
    	  redirect_to products_path
    	else
    		render action: "new"
    	  # redirect_to '/products/new'
    	end    	
    end

    def show
    	@product = Product.find(params[:id])
    end

    def destroy

    	@product = Product.find(params[:id])
    	@product.destroy
    	redirect_to products_url
    end

    def edit
    	@product = Product.find(params[:id])
    end

    def update
    	@product = Product.find(params[:id])
    	respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
        end
    end

    def who_bought
        @product = Product.find(params[:id])
        respond_to do |format|
        format.atom
        format.xml { render :xml => @product }
        end
    end
end
