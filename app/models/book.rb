class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_many :loans
  has_many :users, through: :loans
  enum state: [:on_shelf, :loaned]
end
