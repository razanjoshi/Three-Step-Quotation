class AddUserDetailsToQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :user_name, :string
    add_column :quotes, :user_password, :string
    add_column :quotes, :user_email, :string
    add_column :quotes, :user_phone, :string
  end
end
