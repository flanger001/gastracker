class User < ActiveRecord::Base
  has_secure_password

  validates :email, :uniqueness => true
  validates :name, :presence => true

  has_many :gas_entries, :dependent => :destroy
  has_many :stations, :dependent => :destroy
  has_many :vehicles, :dependent => :destroy

  def guest?
    false
  end
end
