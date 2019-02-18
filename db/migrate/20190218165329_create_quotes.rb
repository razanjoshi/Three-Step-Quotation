class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.text :user_details
      t.float :cost

      t.timestamps
    end
  end
end
