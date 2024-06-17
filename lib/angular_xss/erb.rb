if ERB::Util.private_method_defined? :unwrapped_html_escape
  # Rails 4.2+
  # https://github.com/rails/rails/blob/main/activesupport/lib/active_support/core_ext/erb/util.rb
  module ERBUtilExt
    def html_escape_once(s)
      super(AngularXss::Escaper.escape_if_unsafe(s))
    end

    def unwrapped_html_escape(s)
      super(AngularXss::Escaper.escape_if_unsafe(s))
    end
    # Note that html_escape() and h() are passively fixed as they are calling the two methods above
  end
  ERB::Util.prepend ERBUtilExt
  ERB::Util.singleton_class.prepend ERBUtilExt

else
  ERB::Util.module_eval do
    # Rails < 4.2

    def html_escape_with_escaping_angular_expressions(s)
      html_escape_without_escaping_angular_expressions(AngularXss::Escaper.escape_if_unsafe(s))
    end

    alias_method_chain :html_escape, :escaping_angular_expressions

    # Aliasing twice issues a warning "discarding old...". Remove first to avoid it.
    remove_method(:h)
    alias h html_escape

    module_function :h

    singleton_class.send(:remove_method, :html_escape)
    module_function :html_escape
    module_function :html_escape_without_escaping_angular_expressions
  end
end
