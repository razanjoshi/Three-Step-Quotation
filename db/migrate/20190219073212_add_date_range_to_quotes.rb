class AddDateRangeToQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :subscription_from_date, :datetime
    add_column :quotes, :subscription_to_date, :datetime
  end
end
