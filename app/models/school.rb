class School < ApplicationRecord
  validates :country_code, length: { is: 2 }
  validates :owner, :provider, presence: true
  validates :is_private, inclusion: { in: [ true, false ] }
  validates :provider_is_private, inclusion: { in: [ true, false ] }
end
