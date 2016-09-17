class Photographer < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy

  # belongs_to :owner, class_name: "User", inverse_of: :owned_photographers

  # validates :
end
