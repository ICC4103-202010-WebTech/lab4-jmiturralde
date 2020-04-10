class Customer < ApplicationRecord
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                             message: "invalid email address" }, uniqueness: true
  validates :name, :lastname, presence: true
  has_many :orders
  has_many :tickets, through: :orders
end
