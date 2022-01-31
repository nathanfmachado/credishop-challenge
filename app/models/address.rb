class Address < ApplicationRecord
  belongs_to :proponent
  belongs_to :state

  validates :number, :street, :neighborhood, :city, :state_id, :cep, presence: true
end
