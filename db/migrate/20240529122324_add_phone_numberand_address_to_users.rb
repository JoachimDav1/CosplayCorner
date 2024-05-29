class AddPhoneNumberandAddressToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
  end
end
