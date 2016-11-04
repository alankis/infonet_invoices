class Invoice < ActiveRecord::Base
  self.table_name = "tblinvoices"

  filterrific(
  default_filter_params: {  },
  available_filters: [
    :with_status
    ]
  )

  scope :with_status, lambda { |statuses|
    where(status: [*statuses])
  }

  def self.options_for_select
    order('LOWER(role)').map { |e| [e.status, e.id] }
end

end
