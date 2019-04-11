class Station < ApplicationRecord
  has_many :gas_entries
  belongs_to :user, :optional => true
end
