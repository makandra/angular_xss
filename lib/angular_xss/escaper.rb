module AngularXss
  class Escaper

    def self.escape(string)
      string.gsub('{{', ' { { ')
    end

  end
end

