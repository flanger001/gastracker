class User < ActiveRecord::Base
  has_secure_password

  validates :email, :uniqueness => true
  validates :name, :presence => true

  has_many :stations, :dependent => :destroy
  has_many :vehicles, :dependent => :destroy
  has_many :gas_entries, :through => :vehicles

  def self.from_session(session)
    if session[:user_id]
      find(session[:user_id])
    else
      Guest.new
    end
  end

  def guest?
    false
  end

  class Guest
    def name
      "Guest"
    end

    def email; end

    def id; end

    def guest?
      true
    end

    def persisted?
      false
    end
  end
end
