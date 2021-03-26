class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :active, -> { where(active: true) }
end
