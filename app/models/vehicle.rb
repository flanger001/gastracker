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

  validates :brand, :name, :year, presence: true
end
