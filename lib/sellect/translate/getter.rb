module Sellect::Translate
  class Getter

    def self.register(klass, column)

      klass.send(:define_method, column) do

        new_translation = translations.find_by_locale(Sellect::Translate.locale)
        attribute_from_column = read_attribute(column)
        
        if Sellect::Translate.locale == Sellect::Translate.default_locale
          attribute_from_column
        elsif new_translation.present? && new_translation.params[column].present?
          new_translation.params[column]
        else
          missing_translation = "#{Rails.env.production? ? '' : ' --missing translate'}"
          if attribute_from_column
            if attribute_from_column.is_a?(String)
              attribute_from_column + missing_translation
            else
              attribute_from_column
            end
          else
            missing_translation
          end
        end

      end
    end

  end
end