class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2

      t.timestamps
    end
  end
end
