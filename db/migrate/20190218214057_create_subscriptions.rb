class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.float :daily_rate

      t.timestamps
    end
  end
end
