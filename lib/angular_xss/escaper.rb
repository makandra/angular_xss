module AngularXss
  class Escaper
    
    #BRACE = [
    #  '\\{',
    #  '&lcub;',
    #  '&lbrace;',
    #  '&#x0*7b;',
    #  '&#0*123;',
    #]
    #DOUBLE_BRACE_REGEXP = Regexp.new("(#{BRACE.join('|')})(#{BRACE.join('|')})", Regexp::IGNORECASE)

    def self.escape(string)
      string.gsub('{{', ' { { ')
    end

  end
end

