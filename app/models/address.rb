class Address < ApplicationRecord
  belongs_to :proponent
  belongs_to :state
end
