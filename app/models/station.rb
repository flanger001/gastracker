# == Schema Information
#
# Table name: stations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string
#  city       :string
#  state      :string
#  zip        :string
#  phone      :string
#

class Station < ActiveRecord::Base
  has_many :gas_entries
end
