module Sellect::Translate
  class Getter

    def self.register(klass, column)

      klass.send(:define_method, column) do
        if using_default_locale?
          attribute_from_column(column)
        elsif translated_column(column).present?
          translated_column(column)
        else
          missing_translation(column)
        end
      end

      klass.send(:define_method, :using_default_locale?) do
        current_locale == Sellect::Translate.default_locale
      end

      klass.send(:define_method, :attribute_from_column) do |column|
        read_attribute(column)
      end

      klass.send(:define_method, :locale_translation) do
        Rails.cache.fetch(["#{Sellect::Translate.locale}-translation", self], expires_in: 24.hours ) do
          translations.find_by_locale(Sellect::Translate.locale)
        end
      end

      klass.send(:define_method, :translated_column) do |column|
        locale_translation.params[column] rescue ''
      end

      klass.send(:define_method, :missing_translation) do |column|
        if attribute_from_column(column)
          attribute_with_missing_text(column)
        else
          missing_translation_text
        end
      end

      klass.send(:define_method, :attribute_with_missing_text) do |column|
        if attribute_from_column(column).is_a?(String)
          attribute_from_column(column) + missing_translation_text
        else
          attribute_from_column(column)
        end
      end

      klass.send(:define_method, :missing_translation_text) do
        Rails.env.production? ? '' : ' --missing translate'
      end

    end

  end
end