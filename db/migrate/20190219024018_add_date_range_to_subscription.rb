class AddDateRangeToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :from_date, :datetime
    add_column :subscriptions, :to_date, :datetime
  end
end
