class User < ApplicationRecord
  has_many :loans
  has_many :books, through: :loans

  def full_name
    "#{first_name} #{last_name}"
  end
end
