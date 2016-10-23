class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @company = Company.find(params[:company_id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @categories = Category.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path
    else
      @company = Company.find(params[:company_id])
      @job = Job.find(params[:id])
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end
end
