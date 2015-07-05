# == Schema Information
#
# Table name: gas_entries
#
#  id         :integer          not null, primary key
#  odometer   :integer          default(0)
#  gallons    :float            default(0.0)
#  distance   :float            default(0.0)
#  created_at :datetime
#  updated_at :datetime
#  date       :date
#  notes      :string(255)
#  cost       :float            default(0.0)
#  user_id    :integer
#

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
