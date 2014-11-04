module ActionView
  module Helpers
    module Tags # :nodoc:
      class Base

        private
        def value_before_type_cast(object)
          unless object.nil?
            method_before_type_cast = @method_name + "_before_type_cast"
            # we add a check for translations, should not effect normal rails behavior
            translated = object.respond_to?(:translated_fields) && object.translated_fields.include?(@method_name.to_sym)
            object.respond_to?(method_before_type_cast) && !translated ?
              object.send(method_before_type_cast) :
              value(object)
          end
        end

      end
    end
  end
end