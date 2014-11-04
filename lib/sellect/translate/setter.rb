module Sellect::Translate
  class Setter

    def self.register(klass, column)

      klass.send(:define_method, column.to_s+'=') do |translation|

        if Sellect::Translate.locale == Sellect::Translate.default_locale
          write_attribute(column, translation)
        else
          new_translation = translations.where(locale: Sellect::Translate.locale).first_or_initialize
          params = new_translation.params.nil? ? {} : new_translation.params
          params[column] = translation
          new_translation.params = params
          new_translation.save
        end

      end
    end

  end
end