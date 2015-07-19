class Presenter

  attr_reader :resource, :user, :view

  delegate :to_key,
           :to_param,
           :to_partial_path,
           :new_record?,
           :persisted?,
           to: :resource

  def initialize(args = {})
    @resource = args[:resource]
    @user = args[:user]
    @view = args[:view]
    post_initialize(args)
  end

  def post_initialize(args)
    raise NotImplementedError
  end

end
