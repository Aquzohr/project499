class ReportController < ApplicationController
  def index

  	if params[:commit] == "View Serve Report"
  		@serves = Serve.where(member_id: params[:member_id]).where.not(checkout_time: nil).order(date: :desc, checkout_time: :desc)

      if @serves.blank?
        @serveReport = 1
      end
    end

  	if params[:commit] == "View Receipts Report"
  		@receipts = Receipt.where('date BETWEEN ? AND ?', params[:start_date], params[:end_date]).order(date: :desc)

      if @receipts.blank?
        @receiptReport = 1
      end
    end

  end
end
