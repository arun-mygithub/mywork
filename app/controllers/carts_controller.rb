class CartsController < ApplicationController
	skip_before_filter :authorize, :only => [:create, :update, :delete]

	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.new(params[:cart])
		if @cart.save
		   redirect_to carts_path
		else
			render action: "new"
		end
	end

	def show
		begin

		@cart = Cart.find(params[:id])
	    rescue ActiveRecord::RecordNotFound
	      logger.error "Attempt to access invalid cart #{params[:id]}"
	      redirect_to store_url, :notice => 'Invalid cart'
	    else
	      respond_to do |format|
	      	format.html
	      	format.xml {render :xml => @cart}
	      end
	    end


	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		session[:cart_id] = nil

		respond_to do |format|
            format.html { redirect_to(store_url) }
            format.xml { head :ok }
        end

	end

	def edit
		@cart = Cart.find(params[:id])
	end

	def update
    	@cart = Cart.find(params[:id])
    	respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end
    end
end
