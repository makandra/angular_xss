module AngularXss

  def self.disable(&block)
    Escaper.disable(&block)
  end


  class Escaper

    THREAD_LOCAL_NAME = :_angular_xss_disabled

    #BRACE = [
    #  '\\{',
    #  '&lcub;',
    #  '&lbrace;',
    #  '&#x0*7b;',
    #  '&#0*123;',
    #]
    #DOUBLE_BRACE_REGEXP = Regexp.new("(#{BRACE.join('|')})(#{BRACE.join('|')})", Regexp::IGNORECASE)

    def self.escape(string)
      if disabled?
        string
      else
        string.gsub('{{', ' { { ')
      end
    end

    def self.disabled?
      !!Thread.current[THREAD_LOCAL_NAME]
    end

    def self.disable
      old_disabled = Thread.current[THREAD_LOCAL_NAME]
      Thread.current[THREAD_LOCAL_NAME] = true
      yield
    ensure
      Thread.current[THREAD_LOCAL_NAME] = old_disabled
    end

  end
end

