class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.paginate(:page => params[:page], :per_page => 15)
  end
end
