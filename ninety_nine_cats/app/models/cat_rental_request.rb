# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true

  def self.status_is_pending
    CatRentalRequest.status = "PENDING"
  end

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy 



end
