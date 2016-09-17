class Reservation < ApplicationRecord

  belongs_to :photographer
  belongs_to :users
end
