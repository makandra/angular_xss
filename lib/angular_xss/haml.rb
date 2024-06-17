haml_version = Gem::Version.new(Haml::VERSION)

if haml_version < Gem::Version.new(5)
  # Use module_eval so we crash when Haml::Helpers has not yet been loaded.
  Haml::Helpers.module_eval do
    def html_escape_with_escaping_angular_expressions(s)
      html_escape_without_escaping_angular_expressions(AngularXss::Escaper.escape_if_unsafe(s))
    end

    alias_method :html_escape_without_escaping_angular_expressions, :html_escape
    alias_method :html_escape, :html_escape_with_escaping_angular_expressions
  end
elsif haml_version < Gem::Version.new('5.2')
  # Haml 5.0 and 5.1 fall back to erb
elsif haml_version < Gem::Version.new(6)
  # HAML 5.2+
  module HTMLEscapeWithoutHAMLWithAngularXSS
    def html_escape_without_haml_xss(html)
      super(AngularXss::Escaper.escape_if_unsafe(html))
    end
  end

  Haml::Helpers.singleton_class.prepend HTMLEscapeWithoutHAMLWithAngularXSS
else
  # Haml 6+
  # It ditched most of is own helpers in favor of Haml::Util.escape_html
  # https://github.com/haml/haml/blob/main/CHANGELOG.md#600
  # https://github.com/haml/haml/compare/v5.2.2...v6.3.0
  # https://github.com/haml/haml/blob/v6.3.0/lib/haml/util.rb

  module EscapeHTMLWithAngularXSS
    def escape_html(html)
      super(AngularXss::Escaper.escape_if_unsafe(html))
    end
  end

  Haml::Util.singleton_class.prepend EscapeHTMLWithAngularXSS
end
