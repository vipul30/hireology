class ApplicantController < ApplicationController

  
  def index
     @applicants = Applicant.all.order('id ASC').page params[:page]
     @applicant = Applicant.new
  end

  def new

    @applicant = Applicant.new
    @applicant.job_id = params[:job_id]

    if @applicant.job == nil
        flash[:notice] = "Oops.  It doesn't look like that job is available.<br/>Please select a job to apply for."
        
        redirect_to(:controller => "job", :action => "index")
        return
    end
    
  end

  def create

    @applicant = Applicant.new(applicant_params)
    @applicant.job = Job.find(params[:job_id].to_i)
    @applicant.created = Time.now
    @applicant.modified = Time.now

    

    if @applicant.save
        flash[:notice] = "Thank you " + @applicant.first_name + " for applying to the " +
                          @applicant.job.title + 
                          " position.<br/>Someone from our amazing team will be in touch with you soon."
        
        redirect_to(:controller => "job", :action => "index")
        return
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def show
     @applicant = Applicant.find(params[:id].to_i)
  end

  def edit
  end

  def update
  end

  def delete
  end

  def applicant_params
    params.require(:applicant).permit(:first_name,:last_name,:email,:address,:phone_number,:job_id,:resume,:cover_letter)
  end

end
