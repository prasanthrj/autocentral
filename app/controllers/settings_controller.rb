class SettingsController < ApplicationController
 

def appsettings
	
  
end

def application


    Run.delete_all

    flash[:notice] = "Database Reset Successful"
    
    redirect_to(:back)


 end


end
