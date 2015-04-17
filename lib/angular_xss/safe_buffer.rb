ActiveSupport::SafeBuffer.class_eval do

  if private_method_defined? :html_escape_interpolated_argument

    private

    def html_escape_interpolated_argument_with_rails_xss(arg)
      if arg.html_safe?
        arg
      else
        html_escape_interpolated_argument_without_rails_xss(AngularXss::Escaper.escape(arg))
      end
    end

    alias_method_chain :html_escape_interpolated_argument, :rails_xss

  end

end
