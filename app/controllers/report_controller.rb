class ReportController < ApplicationController
  def index

  	if params[:commit] == "View Serve Report"
  		@serves = Serve.where(member_id: params[:member_id]).where.not(checkout_time: nil).order(date: :desc, checkout_time: :desc)
  	end

  	if params[:commit] == "View Receipts Report"
  		@receipts = Receipt.where('date BETWEEN ? AND ?', params[:start_date], params[:end_date]).order(date: :desc)
  	end

  end
end
