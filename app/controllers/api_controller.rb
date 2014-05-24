class ApiController < ApplicationController

	def show

		@runs = Run.all
		render json: @runs

	end

	# called from http://localhost:3000/api

	def create

	  @runs = Run.new(api_params)
      
		     if @runs.save
		        render json: @runs
		     else
		    	
		     end
   
	end

    def api_params
      params.require(:api).permit(:testcase_name, :testcase_module,:release,:project,:browser,:testcase_status,:testcase_type,:cycle)
    end

end
