class CommentsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    @comment.save

    redirect_to company_job_path(@company, @comment.job)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
