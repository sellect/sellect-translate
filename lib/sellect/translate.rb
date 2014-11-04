require 'sellect/translate/version'
require 'sellect/translate/railtie'
require 'sellect/translate/getter'
require 'sellect/translate/setter'

module Sellect::Translate

  class << self

    def locale
      I18n.locale
    end

    def default_locale
      I18n.default_locale
    end

  end

  module Glue
    def self.included(base)
      base.extend(ClassMethods)
    end
  end

  module ClassMethods
    def translate_fields(*columns)
      columns.each do |column|
        Getter.register(self, column)
        Setter.register(self, column)
      end
    end
  end

end
