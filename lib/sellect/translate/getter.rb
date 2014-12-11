module Sellect::Translate
  class Getter

    def self.register(klass, column)

      klass.send(:define_method, column) do

        new_translation = translations.find_by_locale(Sellect::Translate.locale)
        
        if Sellect::Translate.locale == Sellect::Translate.default_locale
          read_attribute(column)
        elsif new_translation.present? && new_translation.params[column].present?
          new_translation.params[column]
        else
          missing_translation = "#{Rails.env.production? ? '' : ' --missing translate'}"
          read_attribute(column) + missing_translation
        end

      end
    end

  end
end