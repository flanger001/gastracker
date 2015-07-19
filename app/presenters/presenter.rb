class Presenter

  def initialize(args = {})
    post_initialize(args)
  end

  def post_initialize(args)
    raise NotImplementedError
  end

end
