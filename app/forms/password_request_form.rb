class PasswordRequestForm
  include ActiveModel::Model

  attr_accessor :email, :user

  validate :user_exists

  def submit(params)
    self.user = User.find_by(:email => params[:email])
    return false unless valid?
    user.password_request.destroy! if user.password_request.present?
    user.create_password_request!
  end

  private

  def user_exists
    user.persisted?
  end
end
