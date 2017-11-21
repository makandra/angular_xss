ActiveSupport::SafeBuffer.class_eval do

  if private_method_defined? :html_escape_interpolated_argument

    private

    def html_escape_interpolated_argument_with_angular_xss(arg)
      if arg.html_safe?
        arg
      else
        html_escape_interpolated_argument_without_angular_xss(AngularXss::Escaper.escape(arg))
      end
    end

    alias_method :html_escape_interpolated_argument_without_angular_xss, :html_escape_interpolated_argument
    alias_method :html_escape_interpolated_argument, :html_escape_interpolated_argument_with_angular_xss

  end

end
