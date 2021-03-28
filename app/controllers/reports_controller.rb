class ReportsController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:error] = 'お問い合わせが完了しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def report_params
    params.require(:report).permit(:content).merge(end_user: current_end_user)
  end
end
