class PasswordForm
  include ActiveModel::Model

  attr_reader :user
  attr_accessor :original_password, :new_password

  validate :verify_original_password
  validates :original_password, :new_password, :presence => true
  validates :new_password, :confirmation => true
  validates :new_password, :length => { :minimum => 6 }

  def initialize(user)
    @user = user
  end

  def verify_original_password
    return true if user.authenticate(original_password)
    errors.add(:original_password, "is not correct")
  end

  def change_password
    user.password = new_password
  end

  def persisted?
    false
  end

  def submit(params)
    self.original_password = params[:original_password]
    self.new_password = params[:new_password]
    self.new_password_confirmation = params[:new_password_confirmation]
    return false unless valid?
    user.update(:password => new_password)
  end
end
