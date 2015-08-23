class JobController < ApplicationController
  def index
    @jobs = Job.where(is_active: true).order('id ASC').page params[:page]
  end

  def index_admin
    @jobs = Job.all.order('id ASC').page params[:page]
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.created = Time.now
    @job.modified = Time.now

    if @job.save
        flash[:notice] = @job.title + " has been saved."
        
        redirect_to(:controller => "job", :action => "index_admin")
        return
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def show
  end

  def edit
    @job = Job.find(params[:id].to_i)
  end

  def update

    @job = Job.find(params[:id].to_i)
    @job.modified = Time.now

    if @job.update_attributes(job_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Updated Job - " + @job.title
      redirect_to(:action => 'index_admin')
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete

    @job = Job.find(params[:id].to_i)

    if @job.destroy

      flash[:notice] = "Deleted Job - " + @job.title
      redirect_to(:action => 'index_admin')

    else

      flash[:notice] = "Updated Job - " + @job.title
      redirect_to(:action => 'index_admin')

    end

  end
  def job_params
    params.require(:job).permit(:title,:location,:description,:is_active)
  end

end
