class VolunteerExpertise < ApplicationRecord
  belongs_to :volunteer
  belongs_to :expertise
end
