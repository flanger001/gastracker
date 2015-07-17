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

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
