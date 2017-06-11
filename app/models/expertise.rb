class Expertise < ApplicationRecord
  has_many :volunteers
  has_many :girls
end
