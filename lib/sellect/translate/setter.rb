module Sellect::Translate
  class Setter

    def self.register(klass, column)

      # klass.send(:define_method, column) do
      #   original_value = super()

      #   if Sellect::Translate.locale == Sellect::Translate.default_locale
      #     original_value
      #   else
      #     puts "set the translated value from the translation table"
      #   end

      # end
    end
  end
end