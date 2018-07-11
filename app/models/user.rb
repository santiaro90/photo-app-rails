class User < ApplicationRecord
  devise :confirmable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :payment
  accepts_nested_attributes_for :payment
end
