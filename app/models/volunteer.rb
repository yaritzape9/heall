class Volunteer < ApplicationRecord
  has_secure_password
  has_many :volunteer_expertises
  has_many :girl_volunteers
  has_many :expertises, through: :volunteer_expertises
  has_many :girls, through: :girl_volunteers
  has_many :messages
end
