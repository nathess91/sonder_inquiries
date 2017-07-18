class Inquiry < ApplicationRecord
  belongs_to :unit, inverse_of: :inquiries
end
