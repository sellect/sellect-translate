require 'sellect/translate/version'
require 'sellect/translate/railtie'
require 'sellect/translate/getter'
require 'sellect/translate/setter'
require 'sellect/translate/engine'

module Sellect::Translate

  class << self
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
