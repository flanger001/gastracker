class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :gas_entries

  validates :brand, :name, :year, presence: true
  mount_uploader :photo, ImageUploader

  def full_name
    "#{year} #{brand} #{name}"
  end
  class Empty < Vehicle; end
end
