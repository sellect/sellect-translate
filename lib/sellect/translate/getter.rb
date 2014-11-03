module Sellect::Translate
  class Getter

    def self.register(klass, column)

      klass.send(:define_method, column) do
        original_value = super()

        if Sellect::Translate.locale == Sellect::Translate.default_locale
          original_value
        else
          puts "get the translated value from the translation table"
        end

      end
    end

  end
end