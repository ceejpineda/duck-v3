class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :contact_number, :string
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :profile_picture_url, :string
  end
end
