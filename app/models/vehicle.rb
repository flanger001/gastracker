# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  year       :string
#  brand      :string
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :gas_entries

  validates :brand, :name, :year, presence: true

  def full_name
    "#{year} #{brand} #{name}"
  end
  class Empty < Vehicle; end
end
