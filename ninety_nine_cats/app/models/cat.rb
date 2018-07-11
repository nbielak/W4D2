# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  birth_date  :date             not null
#  color       :string           not null
#  sex         :string(1)
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :name, :birth_date, :color, :sex, :description, presence: true
  validate :sex_must_be_m_or_f
  def sex_must_be_m_or_f
    return true if sex.upcase == "M" || sex.upcase == "F"
    false
  end

  def age
    (Date.today - birth_date).to_i / 365
  end

  COLORS = [
    "orange",
    "white",
    "black",
    "brown",
    "grey"
  ]

  def self.colors
    COLORS
  end

  has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
end
