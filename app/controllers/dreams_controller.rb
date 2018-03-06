class DreamsController < ApplicationController

	def index
		@dreams = Dream.all
		@dream = Dream.new
	end

	def create
		@dream = Dream.new(dream_params)
		respond_to do |format|
      		if @dream.save
        		format.json { render json: @block }
      		else
        		format.html { render action: "new" }
        		format.json { render json: @block.errors }
     	 	end
    	end
	end

	private

	def dream_params
		params.require(:dream).permit(:text)
	end

end