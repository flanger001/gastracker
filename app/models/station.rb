class Station < ActiveRecord::Base
  has_many :gas_entries
  belongs_to :user
end
