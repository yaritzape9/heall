class Girl < ApplicationRecord
  has_secure_password
  has_many :girl_volunteers
  has_many :girl_expertises
  has_many :preferences, through: :girl_expertises, source: :expertise
  has_many :volunteers, through: :girl_volunteers
  has_many :messages
end
