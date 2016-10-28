class Photographer < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy

  belongs_to :owner, class_name: "User", inverse_of: :owned_photographers

  validates :name, :address, :phone,  presence: true

  def self.find_by_first_letter(letter)
    @show = where('name LIKE ?', "#{letter}%").order('name ASC')
 end

  def self.search(search)
  where("name LIKE ?", "%#{search}%")
  where("name LIKE ?", "%#{search}%")
end


end
