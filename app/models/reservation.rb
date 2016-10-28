class Reservation < ApplicationRecord

  belongs_to :photographer
  belongs_to :users

    validates :time, :date, presence: true

end
