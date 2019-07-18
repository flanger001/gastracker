# frozen_string_literal: true

class PasswordResetForm
  include ActiveModel::Model
  attr_accessor :new_password, :new_password_confirmation, :user

  validates :new_password, :new_password_confirmation, :presence => true
  validates :new_password, :confirmation => true
  validates :new_password, :length => { :minimum => 6 }

  def initialize(user)
    @user = user
  end

  def submit(params)
    self.new_password = params[:new_password]
    self.new_password_confirmation = params[:new_password_confirmation]
    return false unless valid?
    user.password_request.destroy!
    user.password = params[:new_password]
    user.password_confirmation = params[:new_password]
    user.save
  end
end
