class Proponent < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :contacts, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true

  validates :name, :birth_date, :salary, :inss_discount, presence: true

  paginates_per 5
end
