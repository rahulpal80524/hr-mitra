class Employee < ApplicationRecord
  has_many :documents
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  # validates :city, :state, :country, :phone_number, :address_line_1, :address_line_2, presence: true

  def name
    "#{first_name} #{last_name}".strip
  end
  def name_with_email
   "#{name} - #{email}"
  end
end
