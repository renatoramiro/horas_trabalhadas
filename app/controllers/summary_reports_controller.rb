class SummaryReportsController < ApplicationController
  # GET /summary_reports/1
  # GET /summary_reports/1.json
  def show
    @summary_report = SummaryReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @summary_report }
    end
  end

  # GET /summary_reports/new
  # GET /summary_reports/new.json
  def new
    @summary_report = SummaryReport.new
    @projects = Project.all
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @summary_report }
    end
  end

  # POST /summary_reports
  # POST /summary_reports.json
  def create
    @summary_report = SummaryReport.new(params[:summary_report])

    respond_to do |format|
      if @summary_report.save
        format.html { redirect_to @summary_report, notice: 'Summary report was successfully created.' }
        format.json { render json: @summary_report, status: :created, location: @summary_report }
      else
        format.html { render action: "new" }
        format.json { render json: @summary_report.errors, status: :unprocessable_entity }
      end
    end
  end
end
