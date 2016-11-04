class InvoicesController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Invoice,
      params[:filterrific],
      select_options: {
        with_status: ['Paid', 'Unpaid']
      },

    ) or return
    @invoices = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
