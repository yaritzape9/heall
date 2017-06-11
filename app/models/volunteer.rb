class Volunteer < ApplicationRecord
  has_secure_password
  # has_attached_file :certification
  # validates_attachment :certification, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  has_many :volunteer_expertises
  has_many :girl_volunteers
  has_many :expertises, through: :volunteer_expertises
  has_many :girls, through: :girl_volunteers
  has_many :messages
end
