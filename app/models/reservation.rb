class Reservation < ApplicationRecord

  belongs_to :photographer
  belongs_to :user

    validates :time, :date, presence: true

end
