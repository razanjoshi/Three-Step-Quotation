class AddQKeyToQuote < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :q_key, :string, null: true
  end
end
