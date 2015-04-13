ActionView::Template.class_eval do

  protected

  def compile_with_angular_xss(*args, &block)
    AngularXss.disable do
      compile_without_angular_xss(*args, &block)
    end
  end

  alias_method_chain :compile, :angular_xss

end
