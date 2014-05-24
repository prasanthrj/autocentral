class TestsController < ApplicationController
before_filter :authenticate_user!


  def index
    redirect_to tests_firstpage_path
  end

  def firstpage

  end

  def summary

    @release_options = Run.uniq.pluck(:cycle)
    @project_options = Run.uniq.pluck(:project)


  	@runs = Run.all
  	@releases = Run.uniq.pluck(:cycle)


    @dataArray = [['Module Name','Total Test Cases','Failed',"Skipped","Passed"]]
  	

  	if params[:release]
  	@modulecount = Run.where("cycle like ? " , "%#{params[:release]}%" ).uniq.pluck(:testcase_module)
    end

    if params[:module]
    @modulecount = Run.where("testcase_module like ? " , "%#{params[:module]}%" ).uniq.pluck(:testcase_module)
    end
    
    if params[:project]
    @modulecount = Run.where("project like ? " , "%#{params[:project]}%" ).uniq.pluck(:testcase_module)
    else
    @modulecount = Run.uniq.pluck(:testcase_module)
    end
  


  	@modulecount.each do |modules|

    @modulepasscount = @modulepasscount.to_a.push Run.where(:testcase_module => modules).count
    @modulepassmodule = @modulepassmodule.to_a.push modules

    @dataArray =  @dataArray.to_a.push [modules,Run.where(:testcase_module => modules).count,
    	Run.where(:testcase_module => modules , :testcase_status => "Failed").count,
    	Run.where(:testcase_module => modules , :testcase_status => "Skipped").count,
    	Run.where(:testcase_module => modules , :testcase_status => "Passed").count ]

     end

  end 

  def projects

  	@project = Run.uniq.pluck(:project)

  end

  def releases

  	@releases = Run.uniq.pluck(:cycle)

  end

  def testruns

  	if params[:search]
    @runs = Run.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
    else
    @runs = Run.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
    end
  end

  def extras

  	    @runs = Run.new(:testcase_name=>"Sample Test Case2", :testcase_status=>"Failed", 
    	            :browser=>"crome" , :project=>"EM", :testcase_module=>"Test Module 2", 
    	            :cycle=>"L1R2", :testcase_type=>"Functional").save
        @runs = Run.new(:testcase_name=>"Sample Test Case3", :testcase_status=>"Skipped", 
    	            :browser=>"crome" , :project=>"Notification Engine" , :testcase_module=>"Test Module 3", 
    	            :cycle=>"L1R3", :testcase_type=>"Functional").save

      	@runs = Run.new(:testcase_name=>"Sample Test Case1", :testcase_status=>"Passed", 
  		            :browser=>"crome" , :project=>"PRM", :testcase_module=>"Test Module 1", 
  		            :cycle=>"L1R1", :testcase_type=>"Functional").save

      	@modulepasscount = @modulepasscount.to_a.push Run.where(:testcase_status => "Failed").count

  end


end
