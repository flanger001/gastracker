class GuestUser

  def name
    'Guest'
  end

  def guest?
    true
  end

  def persisted?
    false
  end

end
