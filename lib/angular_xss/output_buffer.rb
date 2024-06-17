##
# Monkey patch ActionView::OutputBuffer to escape double braces from Angular
#
# Link to the original implementation without Angular XSS escaping:
# https://github.com/rails/rails/blob/v7.1.3.4/actionview/lib/action_view/buffers.rb


if defined?(ActionView::VERSION) && Gem::Version.new(ActionView::VERSION::STRING) >= Gem::Version.new('7.1')
  # ActionView < 7.1 used our patched ERB::Util.h to escape, 7.1 switched to CGI.escapeHTML
  module OutputBufferWithEscapedAngularXSS
    def <<(value)
      super(AngularXss::Escaper.escape_if_unsafe(value))
    end

    def concat(value)
      super(AngularXss::Escaper.escape_if_unsafe(value))
    end

    def append=(value)
      super(AngularXss::Escaper.escape_if_unsafe(value))
    end
  end

  ActionView::OutputBuffer.prepend OutputBufferWithEscapedAngularXSS
end
