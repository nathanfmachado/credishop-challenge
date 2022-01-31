class Contact < ApplicationRecord
  belongs_to :proponent

  has_enumeration_for :phone_type, with: PhoneTypeEnum, create_helpers: true
end
