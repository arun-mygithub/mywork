class LineItemsController < ApplicationController
  skip_before_filter :authorize, :only => :create


	def index
		@line_items = LineItem.all
	end

	def new
		@line_item = LineItem.new
	end

	def show
		@line_item=LineItem.find(params[:id])
	end

	def create    
		@cart = current_cart
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product.id)
    respond_to do |format|
      if @line_item.save
          format.json { render json: @line_item, status: :created, location: @line_item }
          format.js { @current_item = @line_item }
          format.html { redirect_to(store_url) }
          format.xml { render :xml => @line_item,
            :status => :created, :location => @line_item }
      else
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
          format.html { render :action => "new" }
          format.xml { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
	end

	def edit
		@line_item=LineItem.find(params[:id])
	end

	def destroy
		@line_item=LineItem.find(params[:id])
		@line_item.destroy
	    redirect_to line_item_path
	end

	def update
    	@line_item = LineItem.find(params[:id])
    	respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end

end