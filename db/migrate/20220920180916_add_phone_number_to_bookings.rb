class AddPhoneNumberToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :phone_number, :string
  end
end
